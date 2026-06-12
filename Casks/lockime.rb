cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.2.1"
  sha256 arm:   "c122732239809727abde454222d92407ccd4f739785f1a6c2fc8a027417c75d9",
         intel: "2381b9dcb0efdd87e03dbed75974cf8b557548987d95a619125121b145d5e349"

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
