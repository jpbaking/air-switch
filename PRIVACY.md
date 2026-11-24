# AirSwitch Privacy Policy

**Short version:** AirSwitch collects **nothing**, uploads **nothing**, and makes **zero** external network requests.

## Data Storage
- All proxy profiles, switch rules, and settings are stored **locally** in your browser's extension storage (`chrome.storage.local` / `IndexedDB`).
- AirSwitch does **not** use cloud sync (`chrome.storage.sync`, GitHub Gist, or WebDAV).
- Local backups exported via **Import/Export → Make backup** are saved directly to your device and never transmitted anywhere.

## Network Activity
- AirSwitch contains **no** telemetry, analytics, crash reporting, ads, or remote update fetchers.
- AirSwitch does **not** download remote PAC URLs, online rule lists, or remote backup files.
- The only `fetch` calls in the extension read static theme files bundled inside the extension package itself.

## Permissions
- `proxy`: Required to apply your chosen proxy profile or Auto Switch PAC script.
- `tabs` / `webRequest` / `webRequestAuthProvider` / `contextMenus`: Used locally to display the active tab's matched rule, monitor failed requests in the optional local Network Monitor, and handle proxy authentication when configured.
- `storage` / `unlimitedStorage`: Used exclusively for local storage of your profiles and settings.

## Contact
If you have questions about this policy, please open an issue at [github.com/jpbaking/air-switch/issues](https://github.com/jpbaking/air-switch/issues).
