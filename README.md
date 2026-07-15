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

> **Existující zákazník** by se do průvodce neměl dostat náhodou — aplikace rozpozná data v databázi a průvodce přeskočí. Pokud kontrola dočasně selže (např. chyba systému), zobrazí se obrazovka s chybou a tlačítkem **Zkusit znovu**, ne prázdný průvodce.

---

## 2. Orientace v aplikaci

Nahoře je **lišta s kartami**: **Prodej · Věk 18+ · Sklad · Historie · Analýza · Uzávěrka**. Úplně vpravo je **ozubené kolo** (Nastavení) a stavové ikony (Wi-Fi, tiskárna, e-podpis) — kliknutím na ně otevřete **Přehled stavu (Health)**.

Vlevo nahoře je logo. Okno má vlastní horní lištu s minimalizací / maximalizací / zavřením.

**Spodní lišta** (nová) — v dolní části obrazovky je lišta s:
- přihlášeným účtem (vlevo)
- aktuálním datem a časem
- počasím (je-li nastavené město)
- zkratkou na **Zdraví (Health)**
- zkratkou na **Nastavení**
- minimálním datem narození (pro ověřování věku)
- ikonou 🔔 **Oznámení** — viz sekce Oznámení níže
- ikonou ⚠ **Hlásit poruchu** — otevře dialog pro odeslání hlášení o poruše

### Oznámení od WellSale týmu

Kliknutím na ikonu zvonku (🔔) v pravém dolním rohu se otevře panel oznámení. Nepřečtené zprávy mají světlejší pozadí, přečtené tmavší. Červená tečka na zvonku znamená, že je nové nepřečtené oznámení.

**Priority oznámení:**
- 🟢 **Nízká** — informační
- 🟡 **Střední** — doporučení
- 🟠 **Vysoká** — důležité
- 🔴 **Okamžitá** — kritické, zobrazí se jako modální dialog ihned při spuštění (s tenkým červeným rámečkem) s odpočtem — tlačítko „OK, rozumím" se aktivuje po 3 sekundách

Tlačítkem **Obnovit** (⟳) v panelu znovu načtete oznámení ze serveru. Klikem na oznámení v seznamu se zobrazí jeho plný text.

> Oznámení označená jako „Pouze pro správce" vidí jen administrátor nebo uživatel s oprávněním spravovat uživatele.

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

**Zákaznický displej:** je-li zapnutý druhý monitor (Nastavení → Zákaznický displej), zákazník vidí košík a celkovou částku, a při platbě QR kód / částku k úhradě hotově. Když v nastavení vyplníte **IBAN** (Nastavení → Provozovna / platba), QR se vygeneruje **automaticky na váš účet a na aktuální částku košíku** (QR Platba / SPAYD) — zákazník jen naskenuje a má předvyplněnou částku.

**IBAN a QR Platba — důležité:**
- IBAN **zkopírujte celý z internetového bankovnictví** — i malá chyba na konci způsobí, že bankovní aplikace hlásí „QR kód neúplný" nebo platbu odmítne.
- Pokud IBAN není platný, QR se **negeneruje** a u pole se zobrazí varování (lepší než nefunkční kód v bankovní aplikaci).
- QR se zobrazí na pokladně i na zákaznickém displeji, jakmile je IBAN v pořádku a zvolíte platbu QR.

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
- **Smazané transakce** — transakce lze „měkce" smazat (tlačítkem Smazat v detailu). Nesmaže se z databáze, jen se skryje. Zaškrtnutím **Zobrazit smazané** v historii uvidíte smazané transakce s červeným rámečkem — jen pro referenci. U smazané transakce lze tlačítkem **Vrátit** obnovit do běžné historie (znovu se počítá do uzávěrek a exportů). Smazané transakce se nepočítají do uzávěrek, exportů ani analytiky, dokud je nevrátíte.
- **Uzávěrka** — souhrn dne. Tlačítkem **Uzavřít dnešní den** vytvoříte uzávěrku (a nahraje se na cloud, pokud je zapnutý). Můžete exportovat **evidenční knihu PML (PDF)**.
- **Pokladní pohyby** (vklad/výdaj hotovosti) — pokud jsou zapnuté.

> **Poznámka k výkonu:** V historii se zobrazuje max. 500 posledních transakcí (200 v nízkoadaptovaném módu). Při dosažení limitu se zobrazí upozornění — zúžte rozsah dat.

---

## 6. Analýza

KPI (tržba, transakce, kusy, největší nákup), srovnání s předchozím obdobím, nejaktivnější dny/hodiny, top produkty, týdenní průběh. Filtr: týden / měsíc / vše / vlastní rozsah. Export do Excelu.

**Přepínání pohledů grafu:**
- Šipka **→** přepne ze **týdenního** na **hodinový** pohled (průměr z vybraného období, 24 sloupců = hodiny dne).
- Šipka **←** přepne zpět na týdenní.
- Při rozsahu více měsíců/let se zobrazí také šipka pro **měsíční** pohled (sloupcový graf po měsících, s výběrem roku).

**Zisk:** v Nastavení → „Sledování zisku" zapněte funkci a u produktů vyplňte **nákupní cenu**. Analýza pak ukáže **zisk** (obrat − nákupní ceny) vedle obratu.

---

## 7. Nastavení (přehled sekcí)

Nastavení otevřete **ozubeným kolem** vpravo nahoře (nebo zkratkou ve spodní liště). Sekce jsou seskupené (vlevo navigace):

- **Účet a vzhled:** Soukromí („Skrýt částky" — rozostří částky; vyberete oblasti, **nově také Sklad**), Vzhled (světlý/tmavý/systém), **Výkon** („Slabý stroj" — vypne animace, sníží frekvenci obnovování pro plynulejší chod na starších PC), **Dotykový mód** (viz níže), **Zákaznický displej** (druhý monitor + výběr monitoru), Uživatelé.
- **Prodejna:** Produkty (vč. nákupní ceny, šarže, formy, velikosti, **kategorie a barvy dlaždice**, dodavatele, **PML příznak**), Sledování zisku, Dodavatelé (**nově s polem Stát** pro roční hlášení), DPH, Sklad.
- **Komunikace:** NTFY oznámení, Tiskárna, Provozovna (IČO/DIČ/povolení PML), Počasí.
- **Systém:** Aktualizace, Automatické uzamčení (PIN po nečinnosti — **0 minut = nikdy nezamknout**), Kurz EUR/CZK, PML export XML, Audit log, Diagnostika.
- **Elektronický podpis** + **Stav systému** + **Fronty** + **Cloudové zálohy** + **Zálohy** (lokální/cloud/Drive).

### Elektronický podpis — ověření a soubory

V sekci **Elektronický podpis** (Nastavení):

- **Podepsat soubor** — podepíše vybraný soubor (PDF/XML → odpojený podpis `.p7s`, XML export → XMLDSig).
- **Zkontrolovat podpis** — dialog se třemi režimy:
  1. **Dokument (soubor)** — přetáhněte nebo vyberte soubor; ověří se XMLDSig, `.p7s` (PKCS#7) nebo záložní `.wssig.json`.
  2. **Skladový pohyb** — vyhledáte pohyb podle ID nebo data; uvidíte, zda podpis sedí, kdo podepsal a platnost certifikátu.
  3. **Transakce** — totéž pro prodej; pokud existuje související skladový pohyb, v detailu je **odkaz na jeho podpis** (a opačně z pohybu na transakci).

> U PDF a exportů z uzávěrky/PML se standardně ukládá **`.p7s`** vedle souboru — to je formát, který banky a úřady očekávají. `.wssig.json` je jen záložní, když HW token momentálně není k dispozici.
- **Šablony prodejen** — export/import konfigurace (produkty, dodavatelé, základní nastavení) pro sdílení mezi pobočkami.
- Dole **Poděkování** (open-source knihovny) a odkazy **wellsale.cz** / **Online administrace**.

### Dotykový mód (nové)

V sekci **Vzhled & přístupnost** lze zapnout **Dotykový mód**. Po zapnutí se u jakéhokoli textového pole zobrazí plná klávesnice na obrazovce, u číselných polí numerická klávesnice. Klávesnice je přetažitelná (podržte záhlaví) a má tlačítko **Hotovo** pro skrytí. Klávesnice zmizí také při přechodu na jinou stránku.

### Zákaznický displej — výběr monitoru

V sekci Zákaznický displej (Nastavení → Účet a vzhled) lze nově vybrat cílový monitor. Pokud máte připojen jen jeden monitor, zobrazí se upozornění „Máte pouze 1 obrazovku — pro zákaznický displej připojte druhý monitor."

### Šablony prodejen

Sekce **Šablony prodejen** (Nastavení) umožňuje:
- **Exportovat šablonu** — uloží produkty, dodavatele a vybraná nastavení do souboru `.json`.
- **Importovat šablonu** — přidá produkty a dodavatele ze souboru do aktuální prodejny (stávající data se nepřepíší, nová se přidají).

> Šablona **neobsahuje** transakce, uzávěrky, historii ani název prodejny.

### Tiskárna a vzhled účtenky
Účtenku lze upravit dvěma způsoby (přepínač **Vizuální editor účtenky**):
- **Klasický (text):** šablony horní/dolní části s placeholdery (`<nazev>`, `<celkem>`, `<cara>`…).
- **Vizuální (bloky):** přetahovací bloky (logo, položky, celkem, QR…) s živým náhledem; u každého bloku zarovnání, tučně, dvojitá výška.
- **Řádek položky `<sale>`:** šablona toho, co se tiskne u každé prodané položky. Výchozí je `<qty>x <nazev><detail_inline>` — za názvem se přidá **forma, velikost a šarže** (jen vyplněné), např. „2x Kratom Zelený prášek 50g (C5464556)"; když produkt nemá nic z toho, je tam jen název. Další placeholdery: `<cena>`, `<detail>` (odděleno ·), `<forma>`, `<velikost>`, `<sarze>`.
- **Výchozí účtenka** neobsahuje DPH ani poznámku; **IČO a DIČ** se vytisknou jen když jsou vyplněné v Provozovně.

### Diagnostika a logy

Sekce **Diagnostika a logy** (Nastavení) zobrazuje log soubor aplikace. Log se vždy ukládá do:

```
Dokumenty\WellSale\log-wellsale.log
```

Tlačítkem **Načíst log** zobrazíte posledních 500 řádků přímo v aplikaci. **Stáhnout log** uloží kopii kamkoli na disk. **Otevřít složku** (ikona 📁) otevře složku s logem v Průzkumníku.

### Fronty a Stav systému
- **Fronty:** přehled čekajících operací (tisk, upload uzávěrek, NTFY) — položku lze odebrat nebo celou frontu zkusit znovu. Tisk, který selže (offline tiskárna), se sem uloží a zopakuje — účtenka se neztratí.
- **Stav systému (Health):** preventivní kontrola — integrita databáze, volné místo, tiskárna, expirace certifikátu, licence a stáří čekajících uploadů (pozná, když se např. uzávěrky neodesílají).

> Sekce, na které nemá přihlášený uživatel oprávnění, se nezobrazí.

### Uživatelé a oprávnění
Admin může vytvářet uživatele s vlastním PINem a sadou oprávnění (tlačítka **Prodavač** / **Administrace** nastaví výchozí sady). Každé oprávnění lze zapnout/vypnout zvlášť.

### Skrýt částky
Tlačítko „Skrýt částky" rozostří peněžní hodnoty (vhodné při sdílení obrazovky). Hodnoty se nemažou — po vypnutí jsou hned čitelné. Checkboxy určují oblasti (Analýza / Historie / Uzávěrky) a jsou aktivní, **jen když je „Skrýt částky" zapnuté**.

### Automatické uzamčení
Po zadaném počtu minut nečinnosti aplikace znovu vyžádá PIN (jen když je PIN zapnutý). **Hodnota 0 = nikdy nezamknout.**

### Debug mód
V Nastavení → Pokročilé lze zapnout Debug mód. Po zapnutí se **F12 / Ctrl+Shift+I / Ctrl+Shift+U** otevřou vývojářské nástroje — **pouze pro adminy** (nebo uživatele s oprávněním „Správa uživatelů").

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

> Před sloučením aplikace vytvoří **bezpečnostní kopii** aktuální databáze. Pokud se kopii nepodaří uložit, sloučení se **neprovede** — vaše data zůstanou nedotčená.

> Při obnově z **jiné licence** se identita (licence, pobočka) automaticky ponechá vaše — nedojde k odhlášení ani neshodě.

### Přidání uzávěrky ze zálohy
Přetáhněte soubor uzávěrky (`.wsbak`/`.db`) do okna → „Přidat do uzávěrek". Pokud z toho data uzávěrku ještě nemáte, přidá se do seznamu (netiskne se, neposílá oznámení). Spolu s uzávěrkou se přidají i **prodeje a skladové pohyby toho dne**, takže k ní funguje i **evidenční kniha PML**.

---

## 9. Chybové zprávy — co znamenají

Pokud se zobrazí chyba (toast v rohu obrazovky nebo dialog), zde je přehled nejčastějších kódů:

| Kód / zpráva | Co to znamená | Co udělat |
|---|---|---|
| **Databáze se probouzí** (`db_warming`) | Cloud databáze se pomalu spouští po nečinnosti (cca 10–30 s). | Počkejte 30 sekund a zkuste znovu. Netřeba panikovat. |
| **Offline** (`offline`) | Aplikace nemá internet. | Zkontrolujte připojení. Prodej funguje i offline, cloud operace ne. |
| **Chyba sítě** (`network_error`) | Přechodná síťová chyba. | Zkuste za chvíli znovu. |
| **Spojení vypršelo** (`timeout`) | Server neodpověděl včas. | Zkuste za chvíli znovu. |
| **Platnost přihlášení vypršela** (`invalid_token`, `missing_token`) | Autentizační token pro cloud vypršel. | Restartujte aplikaci — token se obnoví automaticky. |
| **Licence vypršela** (`license_expired`) | Platnost licence WellSale skončila. | Kontaktujte podporu pro prodloužení. |
| **Licence zrušena** (`license_revoked`) | Licence byla administrátorem deaktivována. | Kontaktujte dodavatele. |
| **Databáze nedovoleně upravena** (`tamper_detected`) | Někdo ručně editoval soubor databáze. | Kontaktujte podporu. Aplikace se zamkne. |
| **Jiný počítač** (`hwid_mismatch`) | Při offline provozu nesedí ID stroje se serverovým záznamem. | Obnovte internet — online ověření HWID problém vyřeší. Nebo kontaktujte podporu. |
| **Chyba ověření požadavku** (`bad_signature`, `missing_signature`) | Chyba při podpisu cloudového požadavku (migrace klíče). | Restartujte aplikaci — klíč se opraví automaticky. Pokud přetrvá, kontaktujte podporu. |
| **Instalace odebrána** (`install_removed`) | Admin v portálu odebral tuto instalaci. | Aplikace se pokusí automaticky reaktivovat. Pokud selže, kontaktujte podporu. |
| **Chybí šifrovací klíč** (`no_key`) | Aplikace nemá klíč pro otevření databáze. | Zkontrolujte internet (klíč se stahuje z cloudu). Kontaktujte podporu. |
| **Není aktivována** (`not_activated`) | Nemáte zadaný licenční klíč. | Projděte průvodcem nastavením. |
| **Nedostatek paměti** (`oom`) | Aplikaci dochází operační paměť. | Zavřete ostatní aplikace (prohlížeč, Cursor). Zapněte „Slabý stroj" v nastavení. |
| **Neplatný IBAN** (varování u QR platby) | IBAN nesedí kontrolní součet — banka QR odmítne. | Zkopírujte IBAN znovu celý z internetového bankovnictví. |

---

## 10. Co dělat v různých situacích

| Situace | Co udělat |
|---|---|
| Zapomenutý PIN | Jiný admin ho změní v Nastavení → Uživatelé. |
| „Aplikace uzamčena" | Zkontrolujte internet, klikněte „Zkontrolovat stav znovu". Při problému kontaktujte podporu (na obrazovce je ID počítače). |
| „Licence svázána s jiným počítačem" | Data nelze přenést jen zkopírováním složky. Pro převod na nové PC kontaktujte podporu. |
| Tiskárna netiskne | Otevřete Přehled stavu (Health) — stav tiskárny. Zkontrolujte připojení a v Nastavení → Tiskárna proveďte testovací tisk. |
| Chci skrýt tržby při sdílení obrazovky | Nastavení → Soukromí → „Skrýt částky". |
| Potřebuju poslat log podpoře | Nastavení → Diagnostika → „Stáhnout log". Log je v `Dokumenty\WellSale\log-wellsale.log`. |
| Červené upozornění „omezený režim" | Nastala chyba databáze. Aplikace běží dál; kontaktujte podporu a pošlete log. |
| Červený banner „obnova databáze" / neshoda klíče | Aplikace vytvořila novou prázdnou databázi, ale **stará data jsou uložená** v souboru `cashier.db.unreadable-…` ve složce aplikace. | Obnovte ze zálohy `.wsbak` (Nastavení → Zálohy) nebo kontaktujte podporu — data nejsou smazaná. |
| Průvodce nastavením se neotevře, jen chyba | Dočasná chyba kontroly — aplikace **záměrně** neukáže prázdný průvodce. | Klikněte **Zkusit znovu**; pokud přetrvá, restartujte PC a pošlete log podpoře. |
| Přechod na nový počítač | Vytvořte zálohu, kontaktujte podporu kvůli převodu licence, na novém PC obnovte ze zálohy. |
| Aplikace šla do černé obrazovky / PIN screenu | Nejde o chybu — je to automatické zamčení (PIN po nečinnosti). Přihlaste se PINem. Pokud se to děje příliš brzy, nastavte delší čas nebo 0 (nikdy) v Nastavení → Automatické uzamčení. |
| Spotřeba paměti vysoká, aplikace pomalá | Zapněte „Slabý stroj" v Nastavení → Výkon. Zavřete jiné aplikace. |

---

## 11. Bezpečnostní doporučení

- **Pravidelně zálohujte** (ideálně zapněte cloud zálohy) — záloha `.wsbak` je jediná spolehlivá cesta k obnově dat.
- **Nemažte pobočku ani licenci** bez předchozí zálohy.
- U **QR Platby** vždy ověřte, že IBAN v nastavení nemá varování — jinak banka platbu nepřijme.
- Pro elektronický podpis používejte **kvalifikovaný (QES)** certifikát.
- Zapněte **PIN** a **automatické uzamčení** na pokladně přístupné více lidem.
- Uchovávejte evidenci a zálohy **5 let** (PML požadavek).

---

## 12. Jak funguje podepisování skladových pohybů?

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

**PDF soubory** (evidenční kniha, PML hlášení): vedle souboru se ukládá odpojený podpis **`.p7s`**
(PKCS#7) — standardní formát pro ověření v Adobe Readeru nebo u úřadů. Záložní `.wssig.json`
se použije jen když HW token není dostupný.

---

## 5. Ověření a odhalení padělku

V aplikaci: **Nastavení → Elektronický podpis → Zkontrolovat podpis** (viz sekce 7 výše).

Technicky:
1. vezmi `podepsanaData`  →  UTF-8 bajty
2. spočítej SHA-256
3. RSA-ověř veřejným klíčem z `certifikat`  proti  `hodnota`

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

## 7. Jak prevest popdis na jiny pocitac:
Samotný soubor certifikátu, který přišel e-mailem (.cer, .crt apod.), neobsahuje soukromý klíč, takže na jiném počítači s ním nelze podepisovat. Soukromý klíč zůstává na počítači, kde byla žádost vytvořena pomocí iSignum/iPostSignum.

Pokud máš stále přístup k původnímu počítači, udělej toto:

Na původním počítači, kde certifikát funguje, spusť iSignum.
Proveď zálohu certifikátu včetně soukromého klíče (obvykle do souboru .pfx nebo .p12) a nastav silné heslo.
Přenes tento soubor na nový počítač.
Na novém počítači importuj .pfx a zadej heslo.

*V případě dotazů kontaktujte dodavatele aplikace.*
