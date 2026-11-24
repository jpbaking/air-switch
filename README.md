# AirSwitch

A strictly offline, Manifest V3 proxy switcher for Chromium-based browsers (Chrome, Brave, Edge) and Firefox, forked from [ZeroOmega](https://github.com/zero-peak/ZeroOmega) / [SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega).

Manage and switch between multiple proxies quickly & easily — with **zero** outgoing network requests, **zero** cloud syncing, and **zero** telemetry.

- [FAQ](https://github.com/jpbaking/air-switch/blob/main/FAQ.md)
- [Privacy Policy](https://github.com/jpbaking/air-switch/blob/main/PRIVACY.md)
- [Issues](https://github.com/jpbaking/air-switch/issues)
- [Releases](https://github.com/jpbaking/air-switch/releases)

## What Makes AirSwitch Different
- **100% Offline / Zero Egress**: Removed GitHub Gist sync, WebDAV sync, `chrome.storage.sync`, online rule lists, remote PAC URLs, online backup restore, background `alarms`, and issue-reporting links.
- **CIDR / IP Routing First-Class**: **IP / CIDR** (`10.0.0.0/8`, `192.168.1.1`, `fc00::/7`) is promoted to the default basic condition types in Auto Switch, with helpful input placeholders across all condition types.
- **Clean Multi-Language Support**: Refined English (`en_US`) copy plus full South Korean (`ko_KR`) translation alongside existing locales.
- **Graceful Legacy Restore**: Local `.bak` files from SwitchyOmega / ZeroOmega can be imported directly—legacy sync and online-URL fields are automatically stripped.

## Building the Project

Node.js (v20+) and npm are required.

```sh
cd omega-build
npm run deps     # Install dependencies in every module
npm run dev      # Link local modules for development
npm run build    # Build all modules -> omega-target-chromium-extension/build
```

Load the generated `omega-target-chromium-extension/build` folder via **Load unpacked** in `chrome://extensions` or `brave://extensions` (with **Developer mode** enabled).

## Project Structure

- `omega-pac` — Standalone PAC script generator and profile/condition model.
- `omega-target` — Browser-independent options manager and profile application logic.
- `omega-web` — Web-based options and popup UI.
- `omega-target-chromium-extension` — Manifest V3 WebExtension target (Chromium & Firefox).
- `omega-locales` — Gettext `.po` translation catalogs compiled to `_locales/*/messages.json`.

## Credits & Attribution

AirSwitch is a fork of [ZeroOmega](https://github.com/zero-peak/ZeroOmega) (by the ZeroOmega Authors), which is a Manifest V3 fork of [SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega) (by FelisCatus and [The SwitchyOmega Authors](https://github.com/jpbaking/air-switch/blob/main/AUTHORS)).

## License

![GPLv3](https://www.gnu.org/graphics/gplv3-127x51.png)

AirSwitch is licensed under the [GNU General Public License](https://www.gnu.org/licenses/gpl.html) Version 3 or later.

AirSwitch is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

AirSwitch is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with AirSwitch.  If not, see <https://www.gnu.org/licenses/>.

## Notice

AirSwitch is an independent open-source proxy configuration tool. It does not provide proxy servers, VPN services, or network connections, and contains no advertisements.
