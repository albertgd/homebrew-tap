class Fcc < Formula
  desc "Free Claude Code - AI coding assistant using Groq (free), OpenAI, or Gemini"
  homepage "https://github.com/albertgd/free-claude-code"
  version "1.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.5/fcc-macos-arm64"
      sha256 "0a51eb2abe5e5c168e5a56feb98d96f0d4f2a6f0ae5fa9ef4a2999b586ca12e2"
    end
    on_intel do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.5/fcc-macos-x64"
      sha256 "59cde8f2ef64ae7ba4c43190b308ca1b19b6b3033cddb16dbe8e2c1cd13702a1"
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
