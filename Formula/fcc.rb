class Fcc < Formula
  desc "Free Claude Code - AI coding assistant using Groq (free), OpenAI, or Gemini"
  homepage "https://github.com/albertgd/free-claude-code"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.3/fcc-macos-arm64"
      sha256 "ade312e808e50bb90b84cd8db816088a984d54f1ad77546dc3859b150ec5650b"
    end
    on_intel do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.3/fcc-macos-x64"
      sha256 "5a646be6cf896ff5c3c79babfc73ef20bb04665d0a65c007e44809c9a3b6f8d0"
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
