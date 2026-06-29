cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.5.0"
  sha256 arm:   "382abbf392e2188f5ad1730beb1714c2e40d07952fee5c06d4ac497a77ce465d",
         intel: "3079fb2d617d6901a2b8a407ed674cd3db0c1d5331428606720cf3b63a4d946b"

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
