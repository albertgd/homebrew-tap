cask "librelink-for-mac" do
  version "1.5.0"
  sha256 "1effcfce5f0e846c933045a4fcbf28a7dcdd32ce3c8530235d6a5123e9ac2c35"

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
