cask "librelink-for-mac" do
  version "1.6.1"
  sha256 "64e335d02593ef63d3d931bc999e03432faf9a3414ea765bd4a6c4567dd68091"

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
