# CLAUDE.md

This repo is the Homebrew tap for
[Timebuddy Incident Investigator](https://github.com/misterbisson/timebuddy-incident-investigator)
— an MCP server + connection manager for Grafana/Graylog incident investigation. It holds
exactly one cask, `Casks/timebuddy.rb`.

## The cask's version/sha256 are machine-written

`timebuddy-incident-investigator`'s `release.yml` (macOS leg of the `release` job) hashes
the just-built `arm64`/`x64` `.dmg`s on every release and pushes a `version`/`sha256`
bump straight to this repo's `main` — see that repo's `electron/CONTRIBUTING.md` for the
automation. Because of that:

- **Never hand-edit `version` or `sha256` in `Casks/timebuddy.rb`.** The next release
  overwrites them anyway, and a manual edit between releases would just be wrong until
  the automation corrects it.
- That automated push goes straight to `main`, bypassing PR review — the one deliberate
  exception to the rule below, and what `main`'s branch-protection bypass entry exists for.

## Everything else goes through a PR

Any change made by a person (or an agent) — `desc`, `caveats`, the `zap`/`uninstall`
stanza, `depends_on`, `livecheck`, or anything under `CONTRIBUTING.md`/CI — opens a PR
against `main` rather than pushing directly. `main` requires the `lint` check (`brew
style` + `brew audit --cask`) to pass before merging.

## Testing a change locally

```bash
brew style --cask Casks/timebuddy.rb
brew audit --cask --online Casks/timebuddy.rb
brew install --cask ./Casks/timebuddy.rb
```
