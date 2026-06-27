# WellSale — uživatelská příručka

Pokladní systém pro prodejny s regulovaným zbožím (PML / kratom dle vyhl. 147/2025 Sb.).
Tato příručka vás provede od prvního spuštění až po každodenní práci.

---

## 1. První spuštění a nastavení

Při prvním spuštění se otevře **průvodce nastavením**. Projdete těmito kroky (některé lze přeskočit):

1. **Licenční podmínky (EULA)** — odsouhlasení.
2. **Licenční klíč** — zadejte klíč ve tvaru `XXXX-XXXX-XXXX-XXX`, který jste obdrželi od dodavatele. Systém klíč ověří online.
3. **Pobočka** — název (např. „Brno – Hlavní") a kódové označení (např. `brno1`). Pokud licence už nějaké pobočky má, vyberete ze seznamu.
4. **Údaje o podniku** — název, adresa, IČO, DIČ a (volitelně) číslo povolení k nakládání s PML. IČO/DIČ/povolení jsou nepovinné, lze doplnit později.
5. **Logo na účtenku** (volitelné).
6. **Tiskárna účtenek** (volitelné) — výběr tiskárny.
7. **Elektronický podpis** (volitelné) — typ certifikátu a kde ho hledat.
8. **Město** (počasí), **Produkty**, **Sklad/pokladní pohyby**, **Oznámení (NTFY)**.
9. **Cloudové zálohy** — zda chcete data zálohovat na zabezpečené servery.
10. **Administrativní účet** — jméno + 5místný PIN. Tímto účtem se přihlašujete.
11. Volitelně další uživatelé, DPH a dokončení.

> Po dokončení se aplikace spustí a přihlásíte se PINem (pokud je PIN zapnutý). PIN píšete **rovnou** — první účet je předvybraný, takže nemusíte nejdřív klikat na uživatele. Při více účtech jdou ostatní vybrat dole.

---

## 2. Orientace v aplikaci

Nahoře je **lišta s kartami**: **Prodej · Věk 18+ · Sklad · Historie · Analýza · Uzávěrka**. Úplně vpravo je **ozubené kolo** (Nastavení) a stavové ikony (Wi-Fi, tiskárna, e-podpis) — kliknutím na ně otevřete **Přehled stavu (Health)**.

Vlevo nahoře je logo. Okno má vlastní horní lištu s minimalizací / maximalizací / zavřením.

---

## 3. Prodej (denní práce)

1. Klikněte na produkty — přidají se do košíku vpravo.
2. Množství upravíte tlačítky **+ / −**, položku odeberete křížkem.
3. Dole vidíte **mezisoučet, DPH a celkem**.
4. **Zaplatit** → vyberte **Hotově** nebo **QR**.
   - U hotovosti zadejte přijatou částku (nebo nechte prázdné) a stiskněte **Enter** — potvrdí prodej a ukáže částku k vrácení. Myš není potřeba.
   - U **QR** se zobrazí QR kód na částku (i na zákaznickém displeji, je-li zapnutý); po zaplacení potvrďte tlačítkem **Zaplaceno**.
5. Pokud je zboží věkově omezené, potvrďte ověření věku.
6. Po prodeji se (je-li zapnuto) automaticky vytiskne účtenka.

**Sleva na produkt:** v Nastavení → Produkty u produktu tlačítko „Sleva". Slevněná cena platí do zadaného data a v košíku se zobrazí přeškrtnutá původní cena.

**Dlaždice produktů:** pod názvem se šedě zobrazuje **forma · velikost · šarže** (jen vyplněné údaje). Dlaždici lze obarvit a zařadit do **kategorie** (záložky nad plochou) v editaci produktu. Tlačítkem **Uspořádat** dlaždice přetáhnete za horní úchyt do jiného pořadí.

**Zákaznický displej:** je-li zapnutý druhý monitor (Nastavení → Zákaznický displej), zákazník vidí košík a celkovou částku, a při platbě QR kód / částku k úhradě hotově. Když v nastavení vyplníte **IBAN**, QR se vygeneruje **automaticky na váš účet a na aktuální částku košíku** (QR Platba / SPAYD) — zákazník jen naskenuje a má předvyplněnou částku.

---

## 4. Sklad

- **Příjem** — naskladnění. Zadáte množství, doklad a datum. **Šarži nezadáváte** — bere se ze šarže nastavené u produktu. Dodavatel se předvyplní z produktu (lze změnit).
- **Odběr** — ruční výdej (ztráta, vlastní spotřeba) s důvodem.
- Při prodeji se sklad odečítá automaticky.
- **Upozornění nízkého stavu** nastavíte u produktu v Nastavení.

### Inventura
V sekci **Sklad** → „Provést inventuru": zadáte skutečně napočítané množství u každého produktu, systém ukáže rozdíl. Volbou „Srovnat" se evidence dorovná. Inventura se uchová pro kontrolu a objeví se v seznamu pohybů. Doporučená je **čtvrtletně** (systém upozorní po termínu).

### Roční hlášení o činnosti s PML (Příloha č. 7)
V sekci Sklad → „Generovat hlášení (PDF)" + výběr roku. Podává se na MZd do konce února za předchozí rok.

---

## 5. Historie a Uzávěrka

- **Historie** — seznam transakcí. Lze **upravit** položku, **vytisknout** znovu, vygenerovat **fakturu (PDF)** a exportovat do Excelu.
- **Uzávěrka** — souhrn dne. Tlačítkem **Uzavřít dnešní den** vytvoříte uzávěrku (a nahraje se na cloud, pokud je zapnutý). Můžete exportovat **evidenční knihu PML (PDF)**.
- **Pokladní pohyby** (vklad/výdaj hotovosti) — pokud jsou zapnuté.

---

## 6. Analýza

KPI (tržba, transakce, kusy, největší nákup), srovnání s předchozím obdobím, nejaktivnější dny/hodiny, top produkty, týdenní průběh. Filtr: týden / měsíc / vše / vlastní rozsah. Export do Excelu.

**Zisk:** v Nastavení → „Sledování zisku" zapněte funkci a u produktů vyplňte **nákupní cenu**. Analýza pak ukáže **zisk** (obrat − nákupní ceny) vedle obratu.

---

## 7. Nastavení (přehled sekcí)

Nastavení otevřete **ozubeným kolem** vpravo nahoře. Sekce jsou seskupené (vlevo navigace):

- **Účet a vzhled:** Soukromí („Skrýt částky" — rozostří částky; vyberete oblasti), Vzhled (světlý/tmavý/systém), **Výkon** („Slabý stroj" — vypne animace pro plynulejší chod na starších PC), **Zákaznický displej** (druhý monitor), Uživatelé.
- **Prodejna:** Produkty (vč. nákupní ceny, šarže, formy, velikosti, **kategorie a barvy dlaždice**, dodavatele), Sledování zisku, Dodavatelé, DPH, Sklad.
- **Komunikace:** NTFY oznámení, Tiskárna, Provozovna (IČO/DIČ/povolení PML), Počasí.
- **Systém:** Aktualizace, Automatické uzamčení (PIN po nečinnosti), Kurz EUR/CZK, PML export XML, Audit log, Diagnostika.
- **Elektronický podpis** + **Stav systému** + **Fronty** + **Cloudové zálohy** + **Zálohy** (lokální/cloud/Drive).
- Dole **Poděkování** (open-source knihovny) a odkazy **wellsale.cz** / **Online administrace**.

### Tiskárna a vzhled účtenky
Účtenku lze upravit dvěma způsoby (přepínač **Vizuální editor účtenky**):
- **Klasický (text):** šablony horní/dolní části s placeholdery (`<nazev>`, `<celkem>`, `<cara>`…).
- **Vizuální (bloky):** přetahovací bloky (logo, položky, celkem, QR…) s živým náhledem; u každého bloku zarovnání, tučně, dvojitá výška.
- **Řádek položky `<sale>`:** šablona toho, co se tiskne u každé prodané položky. Výchozí je `<qty>x <nazev><detail_inline>` — za názvem se přidá **forma, velikost a šarže** (jen vyplněné), např. „2x Kratom Zelený prášek 50g (C5464556)"; když produkt nemá nic z toho, je tam jen název. Další placeholdery: `<cena>`, `<detail>` (odděleno ·), `<forma>`, `<velikost>`, `<sarze>`.
- **Výchozí účtenka** neobsahuje DPH ani poznámku; **IČO a DIČ** se vytisknou jen když jsou vyplněné v Provozovně.

### Fronty a Stav systému
- **Fronty:** přehled čekajících operací (tisk, upload uzávěrek, NTFY) — položku lze odebrat nebo celou frontu zkusit znovu. Tisk, který selže (offline tiskárna), se sem uloží a zopakuje — účtenka se neztratí.
- **Stav systému (Health):** preventivní kontrola — integrita databáze, volné místo, tiskárna, expirace certifikátu, licence a stáří čekajících uploadů (pozná, když se např. uzávěrky neodesílají).

> Sekce, na které nemá přihlášený uživatel oprávnění, se nezobrazí.

### Uživatelé a oprávnění
Admin může vytvářet uživatele s vlastním PINem a sadou oprávnění (tlačítka **Prodavač** / **Administrace** nastaví výchozí sady). Každé oprávnění lze zapnout/vypnout zvlášť.

### Skrýt částky
Tlačítko „Skrýt částky" rozostří peněžní hodnoty (vhodné při sdílení obrazovky). Hodnoty se nemažou — po vypnutí jsou hned čitelné. Checkboxy určují oblasti (Analýza / Historie / Uzávěrky) a jsou aktivní, **jen když je „Skrýt částky" zapnuté**.

### Automatické uzamčení
Po zadaném počtu minut nečinnosti aplikace znovu vyžádá PIN (jen když je PIN zapnutý).

---

## 8. Zálohy a obnova

### Vytvoření zálohy
- **Zálohovat DB** — uloží šifrovaný soubor `.wsbak` (kamkoli zvolíte).
- **Cloud** (je-li zapnutý) — uzávěrky a zálohy se nahrávají automaticky; seznam je v Nastavení → Zálohy.
- **Google Drive** (volitelné).

> Zálohy `.wsbak` jsou šifrované vaším licenčním klíčem.

### Obnova ze zálohy — dvě možnosti
Při obnově (z cloudu nebo přetažením souboru do okna) se otevře náhled obsahu a máte na výběr:

1. **Přepsat ze zálohy** — nahradí aktuální data obsahem zálohy. *(Aplikace se restartuje.)*
2. **Sloučit (přidat)** — **nic se nemaže**. Data ze zálohy se **přidají** k vašim. U položek, které se překrývají (nastavení, produkty, dodavatelé, uživatelé, uzávěrky), si vyberete, co nechat — **svoje**, nebo **ze zálohy**. Historie (transakce, pohyby skladu…) se přidá bez duplicit.

> Při obnově z **jiné licence** se identita (licence, pobočka) automaticky ponechá vaše — nedojde k odhlášení ani neshodě.

### Přidání uzávěrky ze zálohy
Přetáhněte soubor uzávěrky (`.wsbak`/`.db`) do okna → „Přidat do uzávěrek". Pokud z toho data uzávěrku ještě nemáte, přidá se do seznamu (netiskne se, neposílá oznámení). Spolu s uzávěrkou se přidají i **prodeje a skladové pohyby toho dne**, takže k ní funguje i **evidenční kniha PML**.

---

## 9. Co dělat v různých situacích

| Situace | Co udělat |
|---|---|
| Zapomenutý PIN | Jiný admin ho změní v Nastavení → Uživatelé. |
| „Aplikace uzamčena" | Zkontrolujte internet, klikněte „Zkontrolovat stav znovu". Při problému kontaktujte podporu (na obrazovce je ID počítače). |
| „Licence svázána s jiným počítačem" | Data nelze přenést jen zkopírováním složky. Pro převod na nové PC kontaktujte podporu. |
| Tiskárna netiskne | Otevřete Přehled stavu (Health) — stav tiskárny. Zkontrolujte připojení a v Nastavení → Tiskárna proveďte testovací tisk. |
| Chci skrýt tržby při sdílení obrazovky | Nastavení → Soukromí → „Skrýt částky". |
| Potřebuju poslat log podpoře | Nastavení → Diagnostika → „Stáhnout log". |
| Červené upozornění „omezený režim" | Nastala chyba databáze. Aplikace běží dál; kontaktujte podporu a pošlete log. |
| Přechod na nový počítač | Vytvořte zálohu, kontaktujte podporu kvůli převodu licence, na novém PC obnovte ze zálohy. |

---

## 10. Bezpečnostní doporučení

- **Pravidelně zálohujte** (ideálně zapněte cloud zálohy) — záloha `.wsbak` je jediná spolehlivá cesta k obnově dat.
- **Nemažte pobočku ani licenci** bez předchozí zálohy.
- Pro elektronický podpis používejte **kvalifikovaný (QES)** certifikát.
- Zapněte **PIN** a **automatické uzamčení** na pokladně přístupné více lidem.
- Uchovávejte evidenci a zálohy **5 let** (PML požadavek).

---

## 11. Jak funguje podepisování skladových pohybů?


Technicky, krok po kroku.

Co se uloží do DB
Tabulka stock_movements (a stejně transactions) má dva sloupce:

sloupec	obsah
signature	Base64 řetězec — surové bajty RSA podpisu
cert_thumbprint	otisk certifikátu (hex, SHA-1 z certifikátu) — identifikuje, KTERÝM certem (= kým) bylo podepsáno
Co přesně se podepisuje (kanonický řetězec)
Ne celý řádek z DB, ale deterministicky složený string z klíčových polí:

SM|<id>|<product_id>|<delta>|<kind>|<created_at>|<stock_after>
Příklad: SM|412|37|-3|sale|2026-06-27T10:15:00.000Z|18

(U transakce: TX|<id>|<total>|<payment_method>|<created_at>|<itemCount>.)

Funkce: _esignMovementData(sm) / _esignTransactionData v main.cjs.

Jak se z toho vyrobí podpis (_esignSignData, přes PowerShell)
1. cert  = Get-Item Cert:\CurrentUser\My\<thumbprint>     # certifikát (klíč může být na USB tokenu)
2. rsa   = GetRSAPrivateKey(cert)                          # privátní klíč
3. data  = UTF8.GetBytes("SM|412|37|-3|sale|...|18")       # UTF-8 bajty kanonického řetězce
4. sig   = rsa.SignData(data, SHA256, Pkcs1)               # RSA podpis nad SHA-256 hashem, padding PKCS#1 v1.5
5. ulož  = Base64String(sig)                               # → tohle jde do sloupce `signature`
Takže obsah signature = Base64( RSASSA-PKCS1-v1_5( SHA256( UTF8(kanonický_řetězec) ) ) ).
Algoritmus: SHA256withRSA, PKCS#1 v1.5. Délka base64 ≈ podle klíče (2048bit RSA → ~344 znaků).

Uloží to db.updateMovementSignature(id, signature, thumbprint) — běží na pozadí (setImmediate) hned po vytvoření pohybu, certem pracovníka, který ho udělal (per-účet users.cert_thumbprint, fallback globální cert).

Co se z toho dá ověřit (a jak to vypadá v XML exportu)
V PML XML je u záznamu blok <elektronickyPodpis>, který je samonosný (ověřitelný offline):

<elektronickyPodpis>
   <algoritmus>SHA256withRSA (PKCS#1 v1.5)</algoritmus>
   ...otisk certifikátu (thumbprint)...
   <podepsanaData>SM|412|37|-3|sale|2026-06-27T10:15:00.000Z|18</podepsanaData>
   <hodnota>BASE64_PODPISU…</hodnota>
   <certifikat format="base64-DER">MIID… (veřejný certifikát podepisujícího)</certifikat>
</elektronickyPodpis>
podepsanaData = přesně to, co bylo podepsané,
hodnota = base64 podpis (totéž co v DB),
certifikat = veřejný klíč podepisujícího (vložený, takže ověření nepotřebuje přístup do úložiště).
Ověření: vezmu podepsanaData → UTF-8 bajty → SHA-256 → RSA verify veřejným klíčem z certifikat proti hodnota. Když kdokoliv v DB změní třeba delta z -3 na -5, kanonický řetězec je jiný → hash jiný → podpis nesedí → padělek odhalen. A cert_thumbprint říká, čí klíč to byl.

Krátce: do signature jde base64 RSA-SHA256 podpisu UTF-8 řetězce SM|id|product_id|delta|kind|created_at|stock_after, do cert_thumbprint otisk certifikátu podepisujícího.

*V případě dotazů kontaktujte dodavatele aplikace.*
