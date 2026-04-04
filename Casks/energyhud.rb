cask "energyhud" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.1"
  sha256 arm:   "e1772dbdbe0caef2eb68433e1e82a32ce593d4a4d3c64d96cdd374d6a0246fde",
         intel: "d1cb4cc0adb718aab690734e342f05b008ab59c229a7c6398269b54ff5652f5b"

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
