class Dockswipe < Formula
  desc "Synthesize macOS trackpad dock-swipe gestures"
  homepage "https://github.com/oomol-lab/dockswipe"
  # No `version` line: brew scans it from the urls, and audit rejects an
  # explicit one as redundant. bump-dockswipe.yml rewrites the version inside
  # both urls plus the two sha256s, so keep the url layout and 64-hex shas.
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/oomol-lab/dockswipe/releases/download/v0.1.0/dockswipe-0.1.0-arm64.tar.gz"
      sha256 "40f26e84d9fa3175db626a03cc42a9a9d62998e988cb8a85ff15a7dde52eb3dd"
    end
    on_intel do
      url "https://github.com/oomol-lab/dockswipe/releases/download/v0.1.0/dockswipe-0.1.0-x86_64.tar.gz"
      sha256 "8bf9f57e965bb3fc4689ec663bf44b4ac83562e5d6f73ea7d3f881ed1f4ddc37"
    end
  end

  def install
    bin.install "dockswipe"
  end

  test do
    assert_match "dockswipe #{version}", shell_output("#{bin}/dockswipe --version")
  end
end
