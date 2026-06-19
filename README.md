# krejtom-till
versioning

1. Open OPEN-THIS.bat in root folder where all the files are (app, package.json, components etc)
- also make sure fix-update-hash.ps1

2. Input new version number for example 1.4.0 , 1.4.5 , 1.5.9f(for forced)

3. Let the Bat run, after its done go to realeases folder take setup.exe then setup exe.blockmap and latest.yml

4. Make a new release here in this repo, name it v(the version you put in the BAT) so for example v1.4.8 etc. again v1.4.8f for forced update

5. in name put the same thing as tag

6. Describe the update and put the 3 files i listed in step 3 in the release

7. DONE


# WellSale — interní dokumentace (backend)

> Neveřejná dokumentace pro vývojáře a majitele. Popisuje šifrování, databáze,
> API, vazby mezi tabulkami, chyby a postupy obnovy. Verze aplikace: 1.4.0.

---

## 1. Architektura ve zkratce

- **Klient:** Electron 41 + React 18 + TypeScript + Vite + Tailwind/shadcn.
  - `electron/main.cjs` — hlavní proces (IPC, licence, zálohy, tisk, e-podpis, okno).
  - `electron/preload.cjs` — `contextBridge` můstek (`window.cashier.*`).
  - `electron/db.cjs` — lokální SQLite (SQLCipher) + migrace + dotazy.
  - `electron/cloud.cjs` — HTTP klient k cloud API.
  - `electron/backupCrypto.cjs` — AES-256-GCM vrstva pro `.wsbak`.
  - `electron/hwid.cjs` — hardwarový otisk stroje.
  - `src/` — React UI.
- **Cloud:** API Gateway → 1 Lambda (Node) → Aurora (PostgreSQL) + S3.
  - Licence, pobočky, stroje, metadata záloh v Auroře; soubory záloh v S3.

---

## 2. Šifrování a dešifrování

### 2.1 Lokální databáze `cashier.db` (SQLCipher)
- Šifrovaná **per-page** přes `better-sqlite3-multiple-ciphers` (`PRAGMA key`).
- **Klíč (32 bajtů, hex)** je odvozen na **serveru**:
  `dbKey = HMAC-SHA256(klíč = branch.secret, zpráva = license_key)` (hex).
  - Deterministické: stejná `license_key` + stejný `branch.secret` ⇒ stejný klíč.
  - Závisí na `branches.secret` (na serveru). **Smazání pobočky = ztráta secretu = klíč už nikdy neodvodíš ze serveru.**
- Klíč se **cachuje lokálně** v `%APPDATA%\wellsale\db.key.enc`, zabalený přes
  Electron `safeStorage` (**Windows DPAPI**). DPAPI je vázané na **Windows uživatele + stroj** → `db.key.enc` jde rozbalit jen tam, kde vznikl.
- Otevření: `db.init(keyHex)` → `PRAGMA key="x'<hex>'"` → smoke test `PRAGMA user_version`.
  - **Při neshodě klíče** se `cashier.db` přejmenuje na `cashier.db.unreadable-<ts>`
    a vytvoří se **čerstvá prázdná** DB (uptime-first; viz `db.cjs` v `init()`).
- Migrace plain→encrypted: `migrateToEncrypted()` (rekey na hex klíč).

### 2.2 Zálohy `.wsbak` (AES-256-GCM)
- Vrstva NAD plain SQLite (uvnitř je plain `.db`, žádný SQLCipher).
- **Klíč:** `PBKDF2(passphrase, salt, 100000, sha256, 32B)`,
  `passphrase = "wellsale-backup:" + license_key`. **Závisí jen na `license_key`** — ne na serveru, ne na branch.secret, ne na HWID.
- **Formát souboru** (`backupCrypto.cjs`):
  | offset | délka | obsah |
  |---|---|---|
  | 0 | 8 | magic `WSBAK\x01\x00\x00` |
  | 8 | 16 | salt (per-file) |
  | 24 | 12 | IV |
  | 36 | N | ciphertext (AES-256-GCM) |
  | konec | 16 | auth tag |
- Tvorba: `snapshotToPlain()` (VACUUM INTO → rekey na "" = plain) → `encryptFile()`.
- **Důsledek:** `.wsbak` rozšifruješ kdekoli, pokud znáš **starý `license_key`** (nezávislé na serveru). Viz `decrypt-wsbak.cjs` v rootu.

### 2.3 Šifrované settings (DPAPI)
`ENCRYPTED_KEYS` v `main.cjs` (ukládají se s prefixem `enc:`):
`drive_oauth_client_id`, `drive_oauth_client_secret`, `drive_oauth_tokens`, `license_token`.

### 2.4 Tamper-ochrana licence (HMAC)
- `SIGNED_LICENSE_KEYS = [license_key, license_status, license_token_expires_at, remote_hwid]`.
- `license_signature = HMAC-SHA256(LICENSE_SIG_KEY, "k=v|k=v|…")`. Při neshodě → `license_status = tamper_detected` → lockout.
- **Po jakékoli změně podepsaných klíčů zavolej `refreshLicenseSignature()`**, jinak se appka zamkne.

### 2.5 E-podpis (PML evidence)
- Detekce certifikátu přes PowerShell v `Cert:\CurrentUser\My` (i USB token).
- **QES** = kvalifikovaný certifikát → přítomnost rozšíření `qcStatements` (OID `1.3.6.1.5.5.7.1.3`).
- Řízeno settings: `esign_enabled`, `esign_type` (postsignum/ica/eidentita/any), `esign_source`.

### 2.6 HWID (vázání stroje)
- `computeHwid()` = `SHA-256("wellsale-hwid:" + MachineGuid + "|" + CPU ProcessorId + "|" + BaseBoard SN)`, prvních 32 hex znaků.
- Vázáno na **pobočku** (`branches.hwid`, trust-on-first-use). Lokální zrcadlo `remote_hwid` pro offline kontrolu. **Nemá vliv na šifrování DB** — jen lockout.

---

## 3. Lokální DB — tabulky a sloupce (`cashier.db`)

> Migrace: nové sloupce přidává `init()` přes `colExists()` + `ALTER TABLE`. Nové tabulky přes `CREATE TABLE IF NOT EXISTS`. Bezpečné při upgradu.

### `products`
| sloupec | význam |
|---|---|
| id (PK) | identita produktu |
| name, price_czk, sort_order | název, prodejní cena (Kč), pořadí |
| stock, low_stock_threshold | skladem (ks), práh upozornění |
| subtype, form, package_size, unit | PML údaje (podtyp, forma, balení, jednotka) |
| lot_number | šarže tištěná na účtence |
| real_price | **nákupní cena** (pro výpočet zisku v Analýze) |

### `transactions`
| sloupec | význam |
|---|---|
| id (PK) | číslo prodeje |
| created_at, payment_method (cash/qr) | čas, způsob platby |
| subtotal, total, cash_given, change_returned | částky |
| age_verified, age_verified_dob | ověření 18+/21+ |
| manually_added | 1 = doplněno přes manuální uzávěrku |
| signature, cert_thumbprint | e-podpis transakce |

### `transaction_items`
| sloupec | význam |
|---|---|
| id (PK); transaction_id (**FK → transactions.id ON DELETE CASCADE**) | vazba na prodej |
| product_id | odkaz na produkt (může být NULL u smazaného produktu) |
| name_snapshot, price_snapshot, qty | snapshot názvu/ceny/množství v čase prodeje |
| detail_snapshot | JSON {form, package_size, lot_number} pro účtenku |

### `daily_closes`
| sloupec | význam |
|---|---|
| id (PK); close_date | uzávěrka dne |
| total_revenue, total_items, tx_count, cash_total, qr_total | souhrn |
| payload_json | serializovaný souhrn (perProduct apod.) |
| is_auto | 1 = automatická uzávěrka |

### `stock_movements`
| sloupec | význam |
|---|---|
| id (PK); product_id, product_name | pohyb produktu |
| delta (+/−), kind (sale/in/out/adjust), reason | změna a typ |
| transaction_id | u prodeje vazba na transakci |
| batch_id | vazba na šarži (NULL u starých) |
| document_number, stock_after, user_id | doklad, stav po, uživatel |
| supplier_name, supplier_address, supplier_ic | **denormalizovaný dodavatel** (fallback když batch_id NULL) |
| signature, cert_thumbprint | e-podpis pohybu |

### `suppliers`
`id (PK)`, `created_at`, `name`, `address`, `ic` (IČO).

### `batches`
`id (PK)`, `product_id` (**FK → products.id**), `batch_number`, `supplier_id` (**FK → suppliers.id**), `document_number`, `received_at`, `qty_received`, `qty_remaining`, `notes`, `user_id`.

### `product_discounts`
`id (PK)`, `product_id` (**FK → products.id ON DELETE CASCADE**), `discounted_price`, `valid_until`. Aktivní sleva = `valid_until > now`.

### `inventory_checks` / `inventory_items`
- `inventory_checks`: `id (PK)`, `created_at`, `note`, `user_id`, `signature`, `cert_thumbprint`.
- `inventory_items`: `id (PK)`, `inventory_id` (**FK → inventory_checks.id ON DELETE CASCADE**), `product_id`, `product_name`, `expected_qty`, `counted_qty`, `difference`.

### `users`
`id (PK)`, `created_at`, `name` (UNIQUE), `role` (cashier/admin/custom), `pin_code`, `permissions_json` (JSON pole klíčů z `src/lib/permissions.ts`).

### `settings` (key/value) — klíčové položky
| klíč | význam |
|---|---|
| **license_key** | licenční klíč (podepsaný) |
| **license_token** (enc) | JWT z cloudu |
| **license_token_expires_at** | expirace JWT (podepsaná) |
| **license_status** | valid / revoked / expired / token_expired / hwid_mismatch / tamper_detected … (podepsaný) |
| license_type, license_valid_until, license_owner, license_max_machines | metadata licence |
| **branch_id, branch_code, branch_name** | pobočka (zrcadlo cloudu) |
| **install_id** | LEGACY UUID stroje (nahrazeno HWID; jen pro migraci na serveru) |
| **hwid** | aktuální HWID stroje |
| **remote_hwid** | HWID svázaný se serverem (offline kontrola, podepsaný) |
| **license_signature** | HMAC podepsané sady výše |
| ico, dic, pml_permit_number | údaje provozovny (na účtenku/hlášení) |
| esign_enabled, esign_type, esign_source | e-podpis |
| hide_amounts, blur_areas | „Skrýt částky" |
| auto_lock_minutes | automatické uzamčení po nečinnosti |
| profit_tracking_enabled | sledování zisku |
| cloud_enabled | opt-in cloudových záloh |
| pin_enabled, theme, shop_location, shop_address, vat_enabled, vat_rate, … | ostatní |

---

## 4. Cloud DB (Aurora/PostgreSQL)

### `licenses`
`license_key (PK)`, `owner_name`, `owner_email`, `license_type` (lifetime/temporary), `valid_until`, `max_machines` (= max **poboček**), `revoked`, `revoked_reason`, `login_code`, `last_seen_at`, `last_seen_ip`.

### `branches`
`id (PK)`, `license_key` (**FK → licenses.license_key**), `name`, `code` (UNIQUE per licence), `secret` (32B hex — vstup do odvození DB klíče!), `address`, `archived_at`, `hwid`, `hwid_bound_at`, `hwid_previous`.

### `license_machines`
`id (PK)`, `license_key` (**FK → licenses**), `install_id` (drží HWID), `hostname`, `last_seen_ip`, `last_seen_at`, `branch_id` (**FK → branches.id, `ON UPDATE CASCADE`** — viz pozn. níže).

### `cloud_backups`
`id (PK)`, `license_key`, `branch_id`, `s3_key`, `file_name`, `kind` (manual/scheduled/uzaverka/selective/audit_log), `size_bytes`, `uploaded_at`, `metadata_json`.

### `active_tokens`
`token_hash (PK)`, `license_key`, `fingerprint`, `expires_at`.

### `activation_log`
`license_key`, `action`, `success`, `reason`, `ip_address`, `user_agent`, `install_id`.

> **Aplikovaná změna (2026-06):** `license_machines_branch_id_fkey` má `ON UPDATE CASCADE` (změna `branches.id` se propíše do `license_machines.branch_id`).

---

## 5. Vazby, které NESMÍ být měněny samostatně

1. **`branches.secret` ↔ lokální `cashier.db`** — DB klíč = `HMAC(branch.secret, license_key)`. Smažeš/změníš secret → lokální DB se už neodemkne (kromě cache `db.key.enc`). **Nikdy nemaž pobočku, dokud nemáš data zazálohovaná jako `.wsbak`/plain `.db`.**
2. **`license_key` ↔ `.wsbak`** — `.wsbak` je šifrovaný `license_key`. Změna licence ⇒ staré `.wsbak` rozšifruješ jen starým klíčem.
3. **`branches.hwid` ↔ lokální `remote_hwid`/`hwid`** — server porovnává; neshoda → `hwid_mismatch`. Přesun na nové PC = vynulovat `branches.hwid` (TOFU se zaváže znovu).
4. **`settings` podepsaná sada ↔ `license_signature`** — po změně `license_key`/`license_status`/`license_token_expires_at`/`remote_hwid` VŽDY `refreshLicenseSignature()`.
5. **`license_machines.branch_id` ↔ `branches.id`** — FK (teď `ON UPDATE CASCADE`).
6. **`transaction_items.transaction_id` ↔ `transactions.id`** — CASCADE delete.
7. **Identita instalace v záloze** — při restore zálohy z jiné licence se identita (`license_key`, `branch_*`, `install_id`, `hwid`, `remote_hwid`, tokeny) **přepíše na aktuální** (viz `backup:restoreFromFile`), aby nedošlo k neshodě. Stará identita zálohy se uloží do `%APPDATA%\wellsale\restored-backups\`.

---

## 6. Cloud API endpointy (Lambda)

| Metoda + cesta | účel |
|---|---|
| `POST /api/license/info` | náhled licence (read-only); body `{licenseKey, hwid}` |
| `POST /api/license/activate` | aktivace; body `{licenseKey, hwid, installId?, hostname, branchName?/branchCode?/branchId?}` → JWT + dbKey + branch. TOFU HWID + limit poboček. |
| `POST /api/license/check` | ověření přes JWT; body `{hwid}`; porovná HWID s `branches.hwid` |
| `GET /api/branch/dbkey` | vrátí derived DB klíč pro pobočku (recovery) |
| `GET /api/branches/list` | seznam poboček licence |
| `POST /api/backup/upload-url` | pre-signed S3 PUT + zápis řádku do `cloud_backups` |
| `GET /api/backup/list` | seznam záloh (scoped na branch z JWT) |
| `POST /api/backup/download-url` | pre-signed S3 GET |
| `POST /api/backup/delete` | smazání zálohy |
| `POST /api/diagnostic/crash-report` | upload crash reportu |
| `GET/POST /api/admin/*` | admin (licence/pobočky/stroje/zálohy) — hlavička `X-Admin-Key` |

**Klientské IPC** (`preload.cjs`): `cloud.*`, `backup*.*`, `dbkey.*`, `recovery.*`, `win.*`, `esign.*`, `inventory.*`, `log.*`, `app.startupStatus`, …

---

## 7. Stavy licence (lockout) a co znamenají

| `license_status` | příčina | jak vyřešit |
|---|---|---|
| `valid` / `""` | OK | — |
| `revoked` | admin zrušil licenci | unrevoke v adminu |
| `expired` | temporary licence po `valid_until` | prodloužit |
| `token_expired` | offline déle než 7 dní po expiraci JWT (grace 7 dní) | připojit k internetu → recheck |
| `hwid_mismatch` | HWID stroje ≠ `branches.hwid` (zkopírovaná složka / jiné PC) | admin vynuluje `branches.hwid`, pak reaktivace |
| `tamper_detected` | neshoda `license_signature` (ruční editace DB) | reaktivace / oprava podpisu |
| `not_found` | neznámý klíč | správný klíč |
| `branch_required` (428) | víc poboček, klient neurčil kterou | klient vybere pobočku |
| `branch_limit` (403) | dosažen limit poboček licence | zvýšit `max_machines` |
| `missing_hwid` (400) | starý klient neposílá hwid na server co ho vyžaduje | aktualizovat klienta / zmírnit server (`installId = hwid || legacyId`) |

---

## 8. Postupy obnovy (DŮLEŽITÉ)

### 8.1 „Aplikace se nespustí po reaktivaci"
Příčina: nová pobočka → nový DB klíč → starý `cashier.db` se neodemkne → self-heal vytvoří prázdnou DB.
- Self-heal už zajistí, že appka **naběhne** (prázdná DB, spustí se setup).
- Data zachráníš jen z `cashier.db.unreadable-*` + `db.key.enc` (na stejném Windows účtu/PC) nebo z `.wsbak` + starého klíče.

### 8.2 Záchrana dat PŘED reaktivací (preferováno)
1. **Neaktivovat novou licenci** (úspěšná aktivace přepíše `db.key.enc`).
2. Zamčená obrazovka → **„Stáhnout zálohu databáze"** → `.wsbak` (šifrovaný **starým** `license_key`, který je vidět na obrazovce).
3. U vývojáře: `node decrypt-wsbak.cjs zaloha.wsbak STARY-KLIC plain.db` → plain SQLite.
4. Po nové licenci: **obnova z `plain.db`** (plain restore nepotřebuje klíč; identita se sjednotí na aktuální).

### 8.3 Decrypt nástroje v aplikaci (Nastavení → Šifrovací klíč)
- **Decrypt cashier.db** — vybere `db.key.enc` + `cashier.db` → plain `.db`. Funguje **jen na stejném Windows účtu/PC** (rozbaluje DPAPI).
- **Decrypt .wsbak** — zadá se starý `license_key` + soubor → plain `.db`.

### 8.4 Restore zálohy z JINÉ licence
`backup:restoreFromFile` po obnově **sjednotí identitu** (přepíše `license_key`, `branch_*`, `install_id`, `hwid`, `remote_hwid`, tokeny na aktuální instalaci) a **podepíše** (`refreshLicenseSignature`). UI předem upozorní na rozdílný klíč. Stará identita + kopie souboru → `%APPDATA%\wellsale\restored-backups\`.

### 8.5 Degraded mode (uptime-first)
Když selže `db.init`, zapíše se do `%APPDATA%\wellsale\offline-errors.log`, okno se přesto otevře a renderer ukáže červené upozornění (`app:startupStatus`). Log stáhneš v Nastavení → Diagnostika → „Stáhnout log".

---

## 9. Cesty na disku (Windows)

- DB + klíč: `%APPDATA%\wellsale\cashier.db`, `db.key.enc`
- Nečitelná DB po neshodě: `%APPDATA%\wellsale\cashier.db.unreadable-<ts>`
- Offline chyby: `%APPDATA%\wellsale\offline-errors.log`
- Identita obnovených záloh: `%APPDATA%\wellsale\restored-backups\`
- Lokální zálohy / uzávěrky: `Dokumenty\WellSale\Zálohy`, `…\Uzávěrky`
- Crash reporty: `%APPDATA%\wellsale\crash-reports\`

---

## 10. Zlatá pravidla

1. **Nikdy nemaž pobočku ani licenci, dokud nemáš `.wsbak`/plain `.db` zálohu** — ztratíš odvození DB klíče.
2. Po editaci podepsaných settings vždy `refreshLicenseSignature()`.
3. `.wsbak` = přenositelné (jen `license_key`); `db.key.enc` = vázané na PC/uživatele (DPAPI).
4. Restore vždy sjednotí identitu na aktuální instalaci — nehrozí neshoda s cloudem.
5. Migrace DB jsou idempotentní (`colExists`/`IF NOT EXISTS`) — upgrade je bezpečný.
