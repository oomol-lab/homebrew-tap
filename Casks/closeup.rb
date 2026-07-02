cask "closeup" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.1"
  sha256 arm:   "f649a7bffaebac717af946084fd7a216e98b335a001b9786abbb80fe50bac7ce",
         intel: "1667329ae9f3365d1bdc94222bee132ab7c55d773ddf9e7662a24a5f21eef1c3"

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
