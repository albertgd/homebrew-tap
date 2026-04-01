class Fcc < Formula
  desc "Free Claude Code - AI coding assistant using Groq (free), OpenAI, or Gemini"
  homepage "https://github.com/albertgd/free-claude-code"
  version "1.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.6/fcc-macos-arm64"
      sha256 "04b325680147652b5205fe1f54269da297754bfc29b43ef623e99b286584bec8"
    end
    on_intel do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.6/fcc-macos-x64"
      sha256 "c6dd9920866325215694e71f674c0b05a87b1855bc633aaa4813b94702631bb5"
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
