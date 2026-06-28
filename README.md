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

# E‑podpis evidence — technický popis

> Jak WellSale elektronicky podepisuje **skladové pohyby** a **transakce**: co se
> ukládá do DB, co přesně se podepisuje, jakým algoritmem a jak se to ověří.
> Právní rámec: **vyhláška 147/2025 Sb. § 4** (uznávaný el. podpis pracovníka,
> který zápis provedl).

---

## 1. Co se uloží do databáze

Každý podepisovaný řádek (`stock_movements`, `transactions`) má dva sloupce:

| sloupec | typ | obsah |
|---|---|---|
| `signature` | TEXT | **Base64** surových bajtů RSA podpisu |
| `cert_thumbprint` | TEXT | **otisk certifikátu** (hex, SHA‑1 z certifikátu) — identifikuje, kterým certem (= kým) byl řádek podepsán |

> `signature` **není** hash ani heslo — je to skutečný kryptografický podpis,
> ověřitelný veřejným klíčem certifikátu. `cert_thumbprint` říká „čí klíč to byl".

---

## 2. Co přesně se podepisuje (kanonický řetězec)

Nepodepisuje se celý DB řádek, ale **deterministicky složený textový řetězec**
z klíčových polí. Díky pevnému pořadí a oddělovači `|` dá stejný zápis vždy
stejná data → stejný podpis.

**Skladový pohyb** (`_esignMovementData`):
```
SM|<id>|<product_id>|<delta>|<kind>|<created_at>|<stock_after>
```
Příklad:
```
SM|412|37|-3|sale|2026-06-27T10:15:00.000Z|18
```

**Transakce** (`_esignTransactionData`):
```
TX|<id>|<total>|<payment_method>|<created_at>|<itemCount>
```
Příklad:
```
TX|987|450|cash|2026-06-27T10:15:00.000Z|3
```

---

## 3. Jak vzniká podpis

Probíhá **na pozadí** (`setImmediate`) hned po vytvoření pohybu/transakce, certem
**pracovníka**, který zápis provedl (per‑účet `users.cert_thumbprint`; fallback na
globálně detekovaný cert). Vlastní podpis dělá PowerShell nad Windows úložištěm
certifikátů (`_esignSignData`):

```powershell
$c   = Get-Item Cert:\CurrentUser\My\<thumbprint>        # certifikát (klíč může být na USB tokenu)
$rsa = [RSACertificateExtensions]::GetRSAPrivateKey($c)   # privátní klíč
$b   = [Text.Encoding]::UTF8.GetBytes('SM|412|37|-3|...') # UTF-8 bajty kanonického řetězce
$s   = $rsa.SignData($b,
         [HashAlgorithmName]::SHA256,
         [RSASignaturePadding]::Pkcs1)                     # RSA podpis nad SHA-256, padding PKCS#1 v1.5
[Convert]::ToBase64String($s)                             # → uloží se do sloupce `signature`
```

Tedy obsah sloupce `signature`:
```
Base64( RSASSA-PKCS1-v1_5( SHA256( UTF8(kanonický_řetězec) ) ) )
```

| parametr | hodnota |
|---|---|
| hashovací funkce | **SHA‑256** |
| podpisové schéma | **RSA, PKCS#1 v1.5** (`SHA256withRSA`) |
| kódování dat | **UTF‑8** |
| výstup | **Base64** (u 2048bit RSA ≈ 344 znaků) |
| klíč | privátní klíč certifikátu (typicky PostSignum na USB tokenu) |

Uložení: `db.updateMovementSignature(id, signature, thumbprint)` /
`db.updateTransactionSignature(...)`.

---

## 4. Jak to vypadá v PML exportu (XML)

U záznamu je **samonosný** blok `<elektronickyPodpis>` — ověřitelný i **offline**,
protože nese i veřejný certifikát podepisujícího:

```xml
<elektronickyPodpis>
  <algoritmus>SHA256withRSA (PKCS#1 v1.5)</algoritmus>
  <!-- otisk certifikátu (thumbprint) -->
  <podepsanaData>SM|412|37|-3|sale|2026-06-27T10:15:00.000Z|18</podepsanaData>
  <hodnota>BASE64_PODPISU…</hodnota>
  <certifikat format="base64-DER">MIID… (veřejný certifikát podepisujícího)</certifikat>
</elektronickyPodpis>
```

| element | význam |
|---|---|
| `algoritmus` | použité schéma |
| `podepsanaData` | přesně to, co bylo podepsáno (kanonický řetězec) |
| `hodnota` | Base64 podpis (totéž co sloupec `signature`) |
| `certifikat` | veřejný klíč podepisujícího (vložený → ověření nepotřebuje úložiště) |

Celý XML soubor je navíc podepsaný **XMLDSig** (enveloped, SHA‑256) — dvě vrstvy:
podpisy jednotlivých záznamů + jeden podpis přes celý dokument.

---

## 5. Ověření a odhalení padělku

```
1. vezmi `podepsanaData`  →  UTF-8 bajty
2. spočítej SHA-256
3. RSA-ověř veřejným klíčem z `certifikat`  proti  `hodnota`
```

- **Sedí** → záznam je pravý a od podpisu **nezměněný**, podepsal ho držitel daného certifikátu.
- **Nesedí** → s daty se manipulovalo (nebo nesedí klíč).

**Příklad padělku:** kdokoli v DB změní `delta` z `-3` na `-5` → kanonický řetězec
je `SM|412|37|-5|sale|...` → jiný SHA‑256 → podpis **neprojde**. A `cert_thumbprint`
prozradí, čí klíč měl záznam podepsat.

---

## 6. Shrnutí jednou větou

Do `signature` se ukládá **Base64 RSA‑SHA256 (PKCS#1 v1.5) podpisu UTF‑8 řetězce**
`SM|id|product_id|delta|kind|created_at|stock_after` (u transakcí `TX|…`), do
`cert_thumbprint` **otisk certifikátu** podepisujícího — dohromady dokazují
**kdo** zápis provedl a že se **od té doby nezměnil**.

---
## 12. PML Compliance list


# WellSale — compliance s vyhláškou 147/2025 Sb. (evidence PML)

> Mapování požadavků vyhlášky na funkce aplikace. **Není to právní posudek**, ale
> technická kontrola, co software pokrývá. Stav k poslednímu auditu (po doplnění
> podpisu inventury, polí uživatele a inventurního protokolu).
>
> Legenda: ✅ splněno · ⚠️ částečně · ❌ chybí · 🟦 odpovědnost provozovatele (ne software) · 📄 řešeno mimo SW (papírově)

---

## Evidenční záznam — povinná pole a) až n)

| | požadavek | stav | poznámka |
|---|---|---|---|
| a | název PML + forma + podtyp | ✅ | `nazev`, `forma`, `podtyp` (XML i PDF) |
| b | název výrobku + velikost jednotkového balení | ✅ | `nazev` + `velikostBaleni` |
| c | datum příjmu | ✅ | `datumPrijmu` |
| d | datum výdeje | ✅ | `datumVydeje` |
| e | číslo dokladu o příjmu | ✅ | `cisloDokladuPrijmu` |
| f | číslo dokladu o výdeji | ✅ | `cisloDokladuVydeje` (u prodeje `TX-<id>`) |
| g | číslo šarže | ✅ | `cisloSarze` |
| h | jméno/název a sídlo dodavatele | ✅ | `dodavatel` na každém řádku (příjem i výdej, je‑li nastaven) |
| i | množství přijaté | ✅ | `mnozstviPrijate` |
| j | množství vydané | ✅ | `mnozstviVydane` |
| k | jednotka množství | ✅ | `jednotkaMnozstvi` |
| l | stav zásob | ✅ | `stavZasob` |
| m | identifikace osvědčení podle § 33f odst. 2 zákona | 📄 | k dispozici na prodejně v papírové podobě (lze doplnit i do SW jako volitelné pole) |
| n | uznávaný el. podpis osoby, která zápis provedla | ✅ | per‑záznam podpis RSA‑SHA256 + `cert_thumbprint` (per‑účet) |

---

## § 3 — Evidenční kniha (obecné požadavky)

| odst. | požadavek | stav | poznámka |
|---|---|---|---|
| (1) a | jméno/firma + adresa sídla + označení a **adresa provozovny** (je‑li odlišná) | ⚠️ | máme název, adresu, IČO, č. povolení; **sídlo vs. provozovna** zatím jako jedna adresa |
| (1) c | osoba zapisující: jméno + **adresa trvalého pobytu** + **podpisový vzor** + **datum od kdy provádí záznamy** | ✅/⚠️ | jméno ✅, adresa ✅ (nově), datum „od" ✅ (nově); „podpisový vzor" = el. podpis certifikátem (elektronická obdoba) |
| (1) d | datum předání knihy do/z používání | 📄 | papírový koncept; pro el. evidenci viz § 4–5 |
| (1) e | počet listů + číslo prvního/posledního | 📄 | papírový koncept (listy) — pro el. evidenci se neuplatní |
| (1) f | seznam látek s čísly listů | 📄 | papírový koncept |
| (3) | zápis v den skutečnosti + podpis | ✅ | `created_at = teď` + per‑záznam el. podpis |
| (4) | opravy se zachováním obsahu původního záznamu + datum + podpis | ⚠️ | máme event‑sourcing (`transaction_events`) + audit log + korekce skladu jako nový `adjust` pohyb; formální „podepsaná oprava se zobrazením originálu" pro všechny typy ještě doladit |
| (5) | uchování 5 let, ochrana proti znehodnocení | ⚠️ | data se drží lokálně + zálohy; **5letá retence není vynucená/hlídaná** |

---

## § 4 — Elektronická evidence

| odst. | požadavek | stav | poznámka |
|---|---|---|---|
| (1) | denní sledování pohybu a stavu zásob + zpětné zjištění 5 let | ✅/⚠️ | pohyby se `stav_after`, denní uzávěrky; 5letá retence ⚠️ |
| (2) | opravy se zachováním původního + datum + podpis | ⚠️ | viz § 3(4) |
| (3) | jen oprávněné osoby + každý zápis uznávaný el. podpis | ✅ | oprávnění (role/permissions) + per‑záznam podpis |
| (4) | samostatně pro **organizační složky** a pro **činnosti** | ✅/⚠️ | per pobočka = oddělená evidence ✅; oddělení per činnost (příjem/výdej v jedné evidenci) ⚠️ |
| (5) | zápis v den skutečnosti | ✅ | (manuální zpětná uzávěrka je výslovně označená) |
| (6) | okamžitý jednotný **.xml** výstup + **tiskový** výstup | ✅ | PML export XML + PDF |

---

## § 5 — Vedení elektronické evidence

| odst. | požadavek | stav | poznámka |
|---|---|---|---|
| (1) | uchování nosičů dat 5 let + **zálohování bez odkladu po závěrce dne** + zálohy na **odlišných nosičích** | ✅/⚠️ | uzávěrka → auto‑záloha cloud (S3) / Google Drive = jiný nosič ✅; 5letá retence ⚠️ |
| (2) a–h | **vnitřní písemné předpisy** (přístupová práva, zálohování, rekonstrukce, řešení poruch, školení…) | 🟦 | odpovědnost provozovatele; software nedodá (lze připravit šablonu dokumentu) |
| (3) a–f | **evidence poruch** systému (číslo položky, datum poruchy, popis, řešení, podpis, datum), zápis do 14 dní | ❌ | **CHYBÍ** jako funkce; máme jen audit log / crash reporty / offline‑errors.log |

---

## § 6 — Inventura

| odst. | požadavek | stav | poznámka |
|---|---|---|---|
| (1) | čtvrtletní inventura k poslednímu dni čtvrtletí (i bez pohybu) | ✅ | inventura + čtvrtletní upozornění (overdue varování) |
| (2) a–d | záznam o provedení inventury **v listinné podobě**: počáteční stav · celkový příjem · celkový výdej · stav k poslednímu dni | ✅ | **nově** — „Protokol PDF" u inventury (`inventura-protokol-*.pdf`) počítá počáteční/příjem/výdej/konečný za období |
| (3) | datum, jméno, **funkce**, **podpis** osoby | ✅/⚠️ | datum ✅, jméno ✅, **podpis** ✅ (nově — inventura se el. podepisuje certem přihlášeného), **funkce** = kolonka v PDF k ručnímu doplnění ⚠️ |
| (4) | „Stav nezměněn" když bez pohybu | ✅ | **nově** — protokol to uvádí, když v období nenastal pohyb |
| (5) | inventurní protokol při rozdílu (rozdíly, zdůvodnění, datum, jméno, funkce, podpis) | ✅/⚠️ | **nově** — protokol zvýrazňuje rozdíly + sloupec „Zdůvodnění"; zdůvodnění/funkce k ručnímu doplnění |

---

## Shrnutí zbývajících mezer (priorita)

| # | mezera | §  | dopad |
|---|---|---|---|
| 2 | **5letá retence** dat/záloh — politika + kontrola (varovat při chybějících starších zálohách) | § 4(1), § 5(1) | ⚠️ |
| 4 | **Sídlo vs. provozovna** odděleně; **funkce** osoby u inventury | § 3(1)a, § 6(3) | ⚠️ kosmetické/doplňková pole |
| 5 | **Vnitřní předpisy** (přístupy, zálohy, poruchy, školení) | § 5(2) | 🟦 provozovatel — dodat šablonu |

**Splněno:** záznam a–l + n, § 3(3), celé § 4 výstupy + podpisy, § 5(1) zálohování po závěrce, celé § 6 (inventura vč. podpisu a protokolů). Bod **m)** je řešen papírově na prodejně.

---

> **Poznámka k rozsahu:** tato tabulka pokrývá části vyhlášky relevantní pro
> pokladní/skladový software (evidenční záznam, § 3–§ 6). Paragrafy o evidenci pro
> jednotlivé činnosti (pěstování, výroba, lékárny, dovoz/vývoz) a přílohy
> (formuláře/oznámení Ministerstvu zdravotnictví) se týkají registrace a činností
> mimo maloobchodní prodej — nejsou předmětem této aplikace. Pokud je chceš taky
> ztabulkovat, pošli jejich text (oficiální zdroje `zakonyprolidi.cz` /
> `e-sbirka.gov.cz` blokují automatické stažení).
*V případě dotazů kontaktujte dodavatele aplikace.*
