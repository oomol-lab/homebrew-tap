# oomol-lab/homebrew-tap

Homebrew tap for [OOMOL Lab](https://github.com/oomol-lab) apps.

## Usage

```sh
brew install --cask oomol-lab/tap/lockime   # GUI app
brew install --cask oomol-lab/tap/closeup   # GUI app
brew install oomol-lab/tap/dockswipe         # CLI tool
```

(`brew install` taps this repository automatically; no separate `brew tap`
step is needed.)

## Casks

| Cask | App | Notes |
|---|---|---|
| `lockime` | [LockIME](https://github.com/oomol-lab/LockIME) | macOS 14+, separate Apple-silicon/Intel artifacts (the cask picks the right one). Self-updates via Sparkle, so `brew upgrade` skips it unless run with `--greedy`. |
| `closeup` | [CloseUp](https://github.com/oomol-lab/CloseUp) | macOS 14+, separate Apple-silicon/Intel artifacts (the cask picks the right one). Self-updates via Sparkle, so `brew upgrade` skips it unless run with `--greedy`. |

## Formulae

| Formula | Tool | Notes |
|---|---|---|
| `dockswipe` | [dockswipe](https://github.com/oomol-lab/dockswipe) | macOS CLI that synthesizes trackpad dock-swipe gestures. Pre-built, Developer-ID-signed binary per architecture (the formula picks the right one). Needs Accessibility permission to run. |

## How versions are bumped

Each app's release pipeline sends a `repository_dispatch` for every **stable**
release, and a matching bump workflow here downloads the published artifacts,
recomputes both architectures' `sha256`, rewrites the cask/formula, audits it
(`brew style` + `brew audit --online --strict`), and only then pushes. Betas
never reach the tap.

| Source repo | Dispatch event | Bump workflow | Target |
|---|---|---|---|
| LockIME | `lockime-release` | [`bump-lockime.yml`](.github/workflows/bump-lockime.yml) | `Casks/lockime.rb` |
| CloseUp | `closeup-release` | [`bump-closeup.yml`](.github/workflows/bump-closeup.yml) | `Casks/closeup.rb` |
| dockswipe | `dockswipe-release` | [`bump-dockswipe.yml`](.github/workflows/bump-dockswipe.yml) | `Formula/dockswipe.rb` |

Each bump edits an **existing** file in place (version + the two arch
`sha256`s), so the cask/formula must exist first. `Casks/lockime.rb` does, and
`Formula/dockswipe.rb` is committed as a **placeholder seed** (version `0.0.0`,
all-zero `sha256`s); the first dockswipe release auto-fills it. Keep the
placeholder shas as 64 hex chars — the bump's regex matches `[0-9a-f]{64}`, and
the url/sha256 must stay nested in `on_macos` → `on_arm`/`on_intel` (current
`brew style` rejects them in a top-level `on_arm`). The seed commit uses
`[skip ci]` so the not-yet-real release isn't audited online.

Manual fallback: Actions → **Bump lockime** / **Bump closeup** / **Bump
dockswipe** → Run workflow with the released version (e.g. `1.2.3`).

Manual pushes and pull requests are checked by [CI](.github/workflows/ci.yml)
with the same style + audit. (Automated bump pushes don't trigger CI —
`GITHUB_TOKEN` pushes never start workflows — which is why each bump audits
itself before pushing.)
