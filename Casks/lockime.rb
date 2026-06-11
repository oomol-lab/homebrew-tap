cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.2.0"
  sha256 arm:   "939d2db69f8a6c24a98a84377ad79a8a24d18cbba35808025eee805651c8845c",
         intel: "f65559efab230e6a898407adab6572c0b46f8e1790fde157a8b00abe0a811a19"

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
