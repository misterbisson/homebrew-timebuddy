# Contributing

This repo is a single-cask Homebrew tap for
[Timebuddy Incident Investigator](https://github.com/misterbisson/timebuddy-incident-investigator).
See [CLAUDE.md](CLAUDE.md) for the one rule that matters most: `version`/`sha256` in
`Casks/timebuddy.rb` are written by automation, not by hand.

## Making a change

1. Branch off `main`, edit `Casks/timebuddy.rb` (or these docs), open a PR.
2. `lint.yml` runs `brew style` and `brew audit --cask --online` on every PR — fix
   anything it flags before merging.
3. Merge once that check is green. Direct pushes to `main` are blocked for everyone
   except the automation described below.

## Local testing

```bash
brew style --cask Casks/timebuddy.rb
brew audit --cask --online Casks/timebuddy.rb
brew install --cask ./Casks/timebuddy.rb
```

## How releases reach this repo

`timebuddy-incident-investigator`'s `.github/workflows/release.yml` bumps this cask
automatically: on the macOS leg of its `release` job, once `build-mac` finishes, it hashes
the newly built `arm64`/`x64` `.dmg`s directly and pushes a `chore: bump timebuddy cask to
X.Y.Z` commit straight to this repo's `main` — no PR, since it's a single, narrowly-scoped,
machine-verified change (a version string plus two checksums, computed from files that
workflow just built and signed itself).

That push authenticates with `HOMEBREW_TAP_TOKEN`: a fine-grained GitHub PAT scoped to
**this repo only**, with **Contents: read/write** and nothing else. It's generated under
the account that owns this repo, but stored as a secret in the *other* repo
(`timebuddy-incident-investigator`'s Settings → Secrets and variables → Actions), since
that's where the workflow using it runs. See that repo's `electron/CONTRIBUTING.md` for
the full workflow step.

`main`'s branch-protection ruleset requires a passing `lint` check and blocks direct
pushes and force-pushes, with one bypass entry for the account that owns
`HOMEBREW_TAP_TOKEN` — otherwise the automation above would be locked out along with
everyone else.
