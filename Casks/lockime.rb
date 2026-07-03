cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.6.1"
  sha256 arm:   "27a6a768f84d490e2ad8dd1afd8508fe2be887092525c7b93de0bfa8572bec77",
         intel: "229cbac846122dc651467ebdf1f936e456a94bdc554cf40a195872a3894621de"

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
