cask "librelink-for-mac" do
  version "1.6.1"
  sha256 "79f3f1aac06cfd184ef7fd84a486658b23acae8b57dd4cc1b019de09534cbaff"

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
