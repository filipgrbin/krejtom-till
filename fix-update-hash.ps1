# Funkce pro pozastaveni pred zavrenim
function Pause-BeforeExit {
    Write-Host ""
    Read-Host "Stiskni ENTER pro zavreni"
}

try {

    # 1. Najdi package.json
    $packageJsonPath = "./package.json"

    if (-not (Test-Path $packageJsonPath)) {
        if ($PSScriptRoot) {
            $packageJsonPath = Join-Path $PSScriptRoot "package.json"
        }
    }

    if (-not (Test-Path $packageJsonPath)) {
        throw "Soubor package.json nebyl nalezen!"
    }

    $resolvedPath = Resolve-Path $packageJsonPath
    $baseDir = Split-Path $resolvedPath -Parent
    $packageJsonPath = $resolvedPath

    Write-Host "Nalezen adresar s projektem: $baseDir" -ForegroundColor Cyan


    # 2. Nacti package.json
    $package = Get-Content $packageJsonPath -Raw | ConvertFrom-Json
    $currentVersion = $package.version

    Write-Host "Aktualni verze: $currentVersion" -ForegroundColor Gray


    # 3. Dotaz na novou verzi
    $version = Read-Host "Zadejte novou verzi (ENTER = ponechat $currentVersion)"

    if ([string]::IsNullOrWhiteSpace($version)) {
        $version = $currentVersion
        Write-Host "Pouzivam existujici verzi $version" -ForegroundColor Green
    }
    else {
        Write-Host "Aktualizuji verzi na $version" -ForegroundColor Yellow

        $package.version = $version

        $package |
            ConvertTo-Json -Depth 100 |
            Set-Content $packageJsonPath -Encoding UTF8
    }


    # 4. Build
    Write-Host ""
    Write-Host "Spoustim npm run dist..." -ForegroundColor Yellow

    Push-Location $baseDir

    try {
        npm run dist

        if ($LASTEXITCODE -ne 0) {
            throw "npm run dist selhal s kodem $LASTEXITCODE"
        }
    }
    finally {
        Pop-Location
    }


    # 5. Vystupy
    $releaseDir = Join-Path $baseDir "release"
    $exePath = Join-Path $releaseDir "WellSale-Setup-$version.exe"
    $ymlPath = Join-Path $releaseDir "latest.yml"

    if (-not (Test-Path $exePath)) {
        throw "Instalator nebyl nalezen: $exePath"
    }

    if (-not (Test-Path $ymlPath)) {
        throw "latest.yml nebyl nalezen"
    }


    # 6. Hash
    Write-Host ""
    Write-Host "Pocitam SHA512..." -ForegroundColor Yellow

    $sha512Hex = (Get-FileHash $exePath -Algorithm SHA512).Hash

    $bytes = for ($i = 0; $i -lt $sha512Hex.Length; $i += 2) {
        [Convert]::ToByte($sha512Hex.Substring($i, 2), 16)
    }

    $base64Hash = [Convert]::ToBase64String($bytes)
    $fileSize = (Get-Item $exePath).Length


    # 7. Update latest.yml
    $ymlContent = Get-Content $ymlPath -Raw

    $ymlContent = $ymlContent -replace 'sha512:\s+\S+', "sha512: $base64Hash"
    $ymlContent = $ymlContent -replace 'size:\s+\d+', "size: $fileSize"

    Set-Content $ymlPath $ymlContent -NoNewline


    Write-Host ""
    Write-Host "===================================" -ForegroundColor Green
    Write-Host "HOTOVO" -ForegroundColor Green
    Write-Host "Verze: $version" -ForegroundColor Green
    Write-Host "Hash: $base64Hash" -ForegroundColor Green
    Write-Host "Velikost: $fileSize B" -ForegroundColor Green
    Write-Host "===================================" -ForegroundColor Green

}
catch {
    Write-Host ""
    Write-Host "CHYBA:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
}

finally {
    Pause-BeforeExit
}