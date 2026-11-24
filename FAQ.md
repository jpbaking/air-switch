# AirSwitch FAQ

## What is AirSwitch?
AirSwitch is a strictly offline, zero-egress Manifest V3 proxy switcher forked from [ZeroOmega](https://github.com/zero-peak/ZeroOmega) (which itself was forked from [SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega)).

All cloud syncing (GitHub Gist, WebDAV, `chrome.storage.sync`), remote URL downloads (online rule lists, remote PAC URLs, online restore), background `alarms`, and issue-reporting links have been removed.

## Why can't `[System Proxy]` be selected inside Auto Switch rules?
In Chromium-based browsers (Chrome, Brave, Edge), an Auto Switch profile compiles into a **PAC (Proxy Auto-Config)** script. The PAC specification (`FindProxyForURL`) only supports explicit proxy results (`DIRECT`, `PROXY host:port`, `SOCKS5 host:port`, etc.) and has no directive to fall back to the OS/system proxy per request.

**Workaround:** Create a Proxy or PAC profile with your system proxy's settings and select that profile in your Auto Switch rules.

## How do CIDR / IP rules work?
Select **IP / CIDR** in the Auto Switch condition dropdown:
- Supports IPv4 CIDR (e.g. `10.0.0.0/8`, `192.168.0.0/16`) and IPv6 CIDR (e.g. `fc00::/7`).
- A bare IP without a prefix (e.g. `192.168.1.1` or `::1`) automatically defaults to `/32` (IPv4) or `/128` (IPv6).
- Matches **literal IP hosts** in the URL (e.g. `http://10.1.2.3/`), not domain names resolved via DNS.

## Full URL matching on `https://`
Since Chrome 52, Chromium strips the path and query string from `https://` URLs before passing them to PAC scripts (for example, `https://example.com/api/v1` is passed as `https://example.com/`). Because of this browser security policy, path-based **URL wildcard** and **URL regex** rules only match full paths on `http://` URLs. For `https://`, use **Host wildcard**, **Host regex**, or **IP / CIDR**.

## How do I back up and restore my settings?
Go to **Import/Export**:
- Click **Make backup** to download a local `.bak` file.
- Click **Restore from file** to restore from a local `.bak` file. Older SwitchyOmega/ZeroOmega backups are supported—any legacy sync or online rule-list fields are automatically stripped on restore.

## How do I install AirSwitch locally in Chrome / Brave?
1. Build the project (see [README.md](https://github.com/jpbaking/air-switch/blob/main/README.md#building-the-project)).
2. Open `chrome://extensions` or `brave://extensions` and enable **Developer mode**.
3. Click **Load unpacked** and select `omega-target-chromium-extension/build` (or `dist/AirSwitch`).
