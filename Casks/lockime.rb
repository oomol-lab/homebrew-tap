cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.1.0"
  sha256 arm:   "6ca1ac2713cf4e50a5f8810bda4ed27e201fa15220fb89e849797a85ba0d39ba",
         intel: "53d61206b2a8dedaae54965a2f551d5eb53f5d28b3493be076b518fc9989d437"

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
