cask "energyhud" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.0"
  sha256 arm:   "81249050037f85190f202a3ca823c9fe335250de694208bdd95b3593edf6c865",
         intel: "85e6e470c8c0366acad76aeb99fb9c30798c905e6dfba673f917a2c379ff5aa9"

  url "https://github.com/albertgd/EnergyHUD/releases/download/v#{version}/EnergyHUD-#{version}-#{arch}.zip"
  name "EnergyHUD"
  desc "Floating HUD showing the top energy-draining apps and browser tabs in real time"
  homepage "https://github.com/albertgd/EnergyHUD"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "EnergyHUD.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/EnergyHUD.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.yourname.EnergyHUD.plist",
    "~/Library/Saved Application State/com.yourname.EnergyHUD.savedState",
  ]
end
