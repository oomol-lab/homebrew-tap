cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.2.2"
  sha256 arm:   "407ffb60e96a097e3bc7e23c91fd82186c64b0bfd9bf11a004397cdc2b12ebb8",
         intel: "f79c6a277d4a976c6e705e9937e189b023117d57c517feb2a7342b487e97fcdf"

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
