cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.1"
  sha256 arm:   "ef54454fa1c92299b293cd7599f9d8a0b03fcec3a6a7b17aad1406e467ba84f8",
         intel: "7ad001be63c8148467c707afcd1a7d20c1bc634e66cbd08623ec3de737937fb9"

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
