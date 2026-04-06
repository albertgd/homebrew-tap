cask "librelink-for-mac" do
  version "1.2.0"
  sha256 "ff31d60580f330a2ed530fef1b6b64b88b87269ebf7280c377dd1ffb6178d74a"

  url "https://github.com/albertgd/librelink-for-mac/releases/download/v#{version}/LibreLinkForMac.zip"
  name "LibreLink HUD for Mac"
  desc "Menu bar app that displays real-time glucose data from LibreLinkUp with floating HUD"
  homepage "https://github.com/albertgd/librelink-for-mac"

  depends_on macos: ">= :ventura"

  app "LibreLinkForMac.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-cr", "#{appdir}/LibreLinkForMac.app"],
      sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.albertgd.librelinkformac.plist",
  ]
end
