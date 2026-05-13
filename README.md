# krejtom-till
versioning

1. Bump the version
Open package.json, change "version":

"version": "1.0.1"   ← increment this
pokud forced tak "1.0.1f"
2. Build
npm run dist
This produces three files in the release\ folder:

Pokladna Setup 1.0.1.exe

Pokladna Setup 1.0.1.exe.blockmap

latest.yml

3. Create a GitHub Release

Go to github.com/filipgrbin/krejtom-till → Releases → Draft a new release

Tag: v1.0.1 ← must match package.json version with v prefix

Title: v1.0.1 (or v1.0.1f if everyone must update)

Upload all 3 files from the release\ folder
Publish
That's it. ✅

🔄 What happens on the user's machine
Step	What happens
App launches	Window stays hidden while checking krejtom-till releases
Update found	Update dialog appears — user sees it before anything else
Forced (f)	Dialog cannot be closed, app unusable until installed
User clicks Nainstalovat	Delta download starts (only changed bytes, not full Setup.exe)
Download done	App shows "restarting…" and quits
Silent install	New version installs without any wizard
App relaunches	Opens fresh on the new version
No update	Window shows normally, nothing interrupts the user
No internet at startup	Window shows after 8 s timeout, retries when internet comes back
