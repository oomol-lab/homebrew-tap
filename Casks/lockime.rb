cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.7.1"
  sha256 arm:   "03850b0e80cee30652210bd32100bca2d52414cf7d3f7386eef5270d588203a6",
         intel: "42e53cece47679696350917a429d42ababdc6f5523776eceea2150f683f2c7f6"

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
