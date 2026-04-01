class Fcc < Formula
  desc "Free Claude Code - AI coding assistant using Groq (free), OpenAI, or Gemini"
  homepage "https://github.com/albertgd/free-claude-code"
  version "1.0.12"

  on_macos do
    on_arm do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.12/fcc-macos-arm64"
      sha256 "c01e5cf07c29c225e55e6fc997098d281b8b644156f2321f25d1f325fa3ec1f3"
    end
    on_intel do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.12/fcc-macos-x64"
      sha256 "23fe5ed24da2249a0c007955969a33b5a4afdbae2cdcc1b668d90b66634731b5"
    end
  end

  def install
    binary = Hardware::CPU.arm? ? "fcc-macos-arm64" : "fcc-macos-x64"
    bin.install binary => "fcc"
    chmod 0755, bin/"fcc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fcc --version 2>&1")
  end
end
