cask "closeup" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.1"
  sha256 arm:   "57e0faa76bae455bf9066355fa838e2f7e5b8434b009c1115872c30fd6007c3b",
         intel: "b1669b049dc18337e08c6f9ec77180e8363fcf542cc50966320916ff8cef5631"

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
