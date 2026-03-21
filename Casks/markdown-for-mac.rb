cask "markdown-for-mac" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "fe569b9f21a8fb5cba64a3cf7a4d69e23fc475a26affeab80855140d68f3ae05",
         intel: "b9ce7ca3314766b97fef033dfd4509b03a2e9f621d36ae9396cfbc46118ee3d5"

  url "https://github.com/albertgd/markdown-for-mac/releases/download/v#{version}/Markdown.for.Mac-#{version}-#{arch}.dmg"
  name "Markdown for Mac"
  desc "A clean, native markdown viewer for macOS"
  homepage "https://github.com/albertgd/markdown-for-mac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "duti"

  app "Markdown for Mac.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/Markdown for Mac.app"]

    duti = ["/opt/homebrew/bin/duti", "/usr/local/bin/duti"].find { |p| File.exist?(p) }
    if duti
      system_command duti, args: ["-s", "com.markdownformac.app", "net.daringfireball.markdown", "all"]
      system_command duti, args: ["-s", "com.markdownformac.app", ".md", "all"]
      system_command duti, args: ["-s", "com.markdownformac.app", ".markdown", "all"]
    end
  end

  zap trash: [
    "~/Library/Application Support/markdown-for-mac",
    "~/Library/Preferences/com.markdownformac.app.plist",
    "~/Library/Saved Application State/com.markdownformac.app.savedState",
  ]
end
