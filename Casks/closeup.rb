cask "closeup" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.2"
  sha256 arm:   "fd0567a171bed5c8291c4a81d736c9d7c781a94244031c01bb1187e4c874cd72",
         intel: "6663a69daefcccebfc60c941982102698fec052fecf56ef7b747c0061dfa4e74"

  url "https://github.com/oomol-lab/CloseUp/releases/download/v#{version}/CloseUp-#{version}-#{arch}.zip"
  name "CloseUp"
  desc "Menu-bar app that adds window controls to Mission Control"
  homepage "https://github.com/oomol-lab/CloseUp"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "CloseUp.app"

  uninstall quit: "com.oomol.CloseUp"

  zap trash: [
    "~/Library/Application Support/CloseUp",
    "~/Library/Caches/com.oomol.CloseUp",
    "~/Library/HTTPStorages/com.oomol.CloseUp",
    "~/Library/Preferences/com.oomol.CloseUp.plist",
  ]
end
