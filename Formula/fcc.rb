class Fcc < Formula
  desc "Free Claude Code - AI coding assistant using Groq (free), OpenAI, or Gemini"
  homepage "https://github.com/albertgd/free-claude-code"
  version "1.0.11"

  on_macos do
    on_arm do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.11/fcc-macos-arm64"
      sha256 "b464f7cf35c575e32f09287bf9d3afce58b2011f9bd78e84c61ae93a9253d273"
    end
    on_intel do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.11/fcc-macos-x64"
      sha256 "8f4ef4bee59a987f5fd0ae300494d58386ad0f03212515ec98c61bd1af0a516a"
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
