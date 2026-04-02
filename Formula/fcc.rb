class Fcc < Formula
  desc "Free Claude Code - AI coding assistant using Groq (free), OpenAI, or Gemini"
  homepage "https://github.com/albertgd/free-claude-code"
  version "1.0.13"

  on_macos do
    on_arm do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.13/fcc-macos-arm64"
      sha256 "cfb5029eee63c33c0bb065ddccc052e141ba276353b86fd3edcc7a19523a3e71"
    end
    on_intel do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.13/fcc-macos-x64"
      sha256 "93248d7192f18c328aa0d7857de7346819f7204c5a0a581919002e9990acf2e5"
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
