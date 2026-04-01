class Fcc < Formula
  desc "Free Claude Code - AI coding assistant using Groq (free), OpenAI, or Gemini"
  homepage "https://github.com/albertgd/free-claude-code"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.2/fcc-macos-arm64"
      sha256 "34c3d4cd2dd0db795e087bcb68362c6b8b75a8780571d5de4a5028b43ec55ded"
    end
    on_intel do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.2/fcc-macos-x64"
      sha256 "11b5133cd1ec155fa605ebf1257df6bda18475df99311a2a0f2cda76215ee14e"
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
