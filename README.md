# homebrew-timebuddy

Homebrew tap for [Timebuddy Incident Investigator](https://github.com/misterbisson/timebuddy-incident-investigator),
an MCP server + connection manager for Grafana/Graylog incident investigation.

## Install

```bash
brew tap misterbisson/timebuddy
brew trust misterbisson/timebuddy
brew install --cask timebuddy
```

Homebrew refuses to load casks from a third-party tap until it's trusted, so the `brew
trust` step is required and not merely advisory — without it, `brew install` stops with
`Refusing to load cask ... from untrusted tap`. To trust only this cask instead of the
whole tap:

```bash
brew trust --cask misterbisson/timebuddy/timebuddy
```

## Casks

### `timebuddy` — [Timebuddy Incident Investigator](https://github.com/misterbisson/timebuddy-incident-investigator)

The cask installs a Developer ID signed, notarized `.dmg` — the same one published on the
project's [GitHub Releases](https://github.com/misterbisson/timebuddy-incident-investigator/releases)
page — so installation raises no Gatekeeper prompt. Homebrew verifies the release
checksum before installing. Version/checksum bumps are pushed here automatically by the
main repo's release workflow on every new version.

To remove it:

```bash
brew uninstall --cask timebuddy
```

Uninstalling removes the app bundle only. It deliberately preserves your saved Grafana/
Graylog connections and credentials. To remove those too:

```bash
brew uninstall --zap --cask timebuddy
```
