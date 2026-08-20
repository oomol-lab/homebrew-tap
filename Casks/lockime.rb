cask "lockime" do
  arch arm: "arm64", intel: "x86_64"

  version "1.7.0"
  sha256 arm:   "b377c5cc63c75a92ecb6d92b849754597162c8b6740a4d1656bd0c8783406235",
         intel: "fe2845f46c93f2e331b977bb32b60022f8b79474eeccd4c1e7407b8afb62e836"

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
