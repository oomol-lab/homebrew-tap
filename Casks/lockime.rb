cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.0"
  sha256 arm:   "0eacd6e79eddb3c6e1d125e63bfe09a364e4e3d2bf8711b5453fd10ee94919a4",
         intel: "da0fa93251f4fbbbda5b932e57bcb7744444170149105fe1c91ba79f2b66657f"

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
