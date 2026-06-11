cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.1.1"
  sha256 arm:   "e41eac14a46a960cd1ffa6566f3e280b8b517269e49b12ba19b3fa2dadfadc29",
         intel: "0af996de5d00d194d6f6694ac83bb84ed7a3b40d11db01a271f4600e5a3aea29"

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
