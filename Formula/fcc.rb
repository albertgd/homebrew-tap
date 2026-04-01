class Fcc < Formula
  desc "Free Claude Code - AI coding assistant using Groq (free), OpenAI, or Gemini"
  homepage "https://github.com/albertgd/free-claude-code"
  version "1.0.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.7/fcc-macos-arm64"
      sha256 "4506c5e11a541d5cfb17beb79db9079011bf4c7fb2f9a8116023dd1a6eee0436"
    end
    on_intel do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.7/fcc-macos-x64"
      sha256 "007ef2e5add1804579eb0b55c8692ff2e078d8a735c3d9321fc93b93e0fabc69"
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
