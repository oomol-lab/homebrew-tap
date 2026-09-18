cask "closeup" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.3"
  sha256 arm:   "d3cae565fa9d68f28036b131da8c3382235114ec829a27402c6e38ba230fe092",
         intel: "1244b24f9d85132f93852ca04de658cacbb93285ceb7d9dd54f2424b30c809b3"

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
