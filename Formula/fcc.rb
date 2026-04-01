class Fcc < Formula
  desc "Free Claude Code - AI coding assistant using Groq (free), OpenAI, or Gemini"
  homepage "https://github.com/albertgd/free-claude-code"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.0/fcc-macos-arm64"
      sha256 "11adb72d618f95164a6fdcd245ff86c4edb7a768b74f7845d9a370f49a251533"
    end
    on_intel do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.0/fcc-macos-x64"
      sha256 "15ae77a916df0d91fe1503e305c0f43171738ab6b902d813968e84f74a0b3cd0"
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
