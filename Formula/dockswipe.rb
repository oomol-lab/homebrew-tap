class Dockswipe < Formula
  desc "Synthesize macOS trackpad dock-swipe gestures"
  homepage "https://github.com/oomol-lab/dockswipe"
  # PLACEHOLDER seed — version 0.0.0 + all-zero sha256s. The first dockswipe
  # release auto-fills these via bump-dockswipe.yml. The shas MUST stay 64 hex
  # chars (the bump's regex matches [0-9a-f]{64}); do not replace with a word.
  # Commit this with [skip ci] so the not-yet-real release isn't audited online.
  version "0.0.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/oomol-lab/dockswipe/releases/download/v#{version}/dockswipe-#{version}-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/oomol-lab/dockswipe/releases/download/v#{version}/dockswipe-#{version}-x86_64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "dockswipe"
  end

  test do
    assert_match "dockswipe #{version}", shell_output("#{bin}/dockswipe --version")
  end
end
