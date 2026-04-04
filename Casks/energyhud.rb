cask "energyhud" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.2"
  sha256 arm:   "f0d0561f0b0d1ac5f8410798222d40fbb8d7a965d74d5862371951ddf6a5e7bf",
         intel: "61bdaeb0e4e989636117d316db0e9c89c2ff10d8b8222c17ef2bb4eb3fa75343"

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
