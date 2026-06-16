cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.0"
  sha256 arm:   "c2807c47d935a750fa48b668719d1fc84baa60d7d8d6a50793c64d6a627668fa",
         intel: "4a1b59e1ddf9edb8a5265500dcefbe6f7e2e7a3ded219d70d53aa8f613d772e8"

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
