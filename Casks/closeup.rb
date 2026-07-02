cask "closeup" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.0"
  sha256 arm:   "c95191f1a5a8a66a6d2de50b91079353e75b155c366e7a3df9bf7dd2fce283c1",
         intel: "0378540e2ef6dfaa11db846a6723bcbe57dae91f26bd5109594b0a4609f7f636"

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
