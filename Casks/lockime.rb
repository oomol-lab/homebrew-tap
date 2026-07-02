cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.6.0"
  sha256 arm:   "6e0a86deacf626dbc665318e48cfd869d2fb00793d141f2de38b9763703aed1c",
         intel: "c239e3283cf48437b38e10dc3c28cc34070d7ec06ea75875c9479f442fd678a7"

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
