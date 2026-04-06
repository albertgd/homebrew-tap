cask "librelink-for-mac" do
  version "1.1.0"
  sha256 "0e416a2967e4a101cd247e6d77b702e64e589b7be632fd3480864a274c1507b9"

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
