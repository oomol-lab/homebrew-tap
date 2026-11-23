cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.7.2"
  sha256 arm:   "dfdf29af04d9704a289eacc22a8786fa8269d0adff0c11102ec3a15943ede5c2",
         intel: "38519603c126e219c5f935e58bc529909d779523ecf8ba05372b4ec8a35264ab"

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
