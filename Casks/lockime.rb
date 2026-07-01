cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.5.1"
  sha256 arm:   "7544ad69e8832bf1b9fc690d5e200f53b70ee0a1fa8994794f100f43b7bc2b5b",
         intel: "a7b7f4a6af0e1622a0d70d32a03be763c8ac30ac7a84396a89c9f1fdfcb1f4a9"

  url "https://github.com/oomol-lab/LockIME/releases/download/v#{version}/LockIME-#{version}-#{arch}.zip"
  name "LockIME"
  desc "Menu-bar app that locks the keyboard input source"
  homepage "https://github.com/oomol-lab/LockIME"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "LockIME.app"

  uninstall quit: "com.oomol.LockIME"

  zap trash: [
    "~/Library/Application Support/LockIME",
    "~/Library/Caches/com.oomol.LockIME",
    "~/Library/HTTPStorages/com.oomol.LockIME",
    "~/Library/Preferences/com.oomol.LockIME.plist",
  ]
end
