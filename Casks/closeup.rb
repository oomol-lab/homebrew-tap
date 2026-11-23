cask "closeup" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.4"
  sha256 arm:   "ed535b60f029c3242e2acb9c47df01efb56195491e16fcff1519b47a3eb4e4ba",
         intel: "692f8625845bb1062115fb536f8479fced13f33adc324f03041320c13a4052f9"

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
