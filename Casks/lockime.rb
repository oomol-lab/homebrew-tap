cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.6.2"
  sha256 arm:   "0ebb2d74c9d75aedcf8261cbdbdacb0c035132d907acc9040d9a36e352f8d44f",
         intel: "578ae14d6c8b71409991d69d88e6ffef7e3b834871c3e7372dd532a5d00bd7d1"

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
