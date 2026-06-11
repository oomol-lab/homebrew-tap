# oomol-lab/homebrew-tap

Homebrew tap for [OOMOL Lab](https://github.com/oomol-lab) apps.

## Usage

```sh
brew install --cask oomol-lab/tap/lockime
```

(`brew install` taps this repository automatically; no separate `brew tap`
step is needed.)

## Casks

| Cask | App | Notes |
|---|---|---|
| `lockime` | [LockIME](https://github.com/oomol-lab/LockIME) | macOS 14+, separate Apple-silicon/Intel artifacts (the cask picks the right one). Self-updates via Sparkle, so `brew upgrade` skips it unless run with `--greedy`. |

## How versions are bumped

`Casks/lockime.rb` is updated automatically: the LockIME release pipeline
sends a `repository_dispatch` (event `lockime-release`) for every **stable**
release, and [`bump-lockime.yml`](.github/workflows/bump-lockime.yml)
downloads the release zips, recomputes both architectures' `sha256`, rewrites
the cask, audits it (`brew style` + `brew audit --cask --online --strict`),
and only then pushes. Betas never reach the cask.

Manual fallback: Actions → **Bump lockime** → Run workflow with the released
version (e.g. `1.2.3`).

Manual pushes and pull requests are checked by [CI](.github/workflows/ci.yml)
with the same style + audit. (Automated bump pushes don't trigger CI —
`GITHUB_TOKEN` pushes never start workflows — which is why the bump audits
itself before pushing.)
