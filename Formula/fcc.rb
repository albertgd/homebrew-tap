class Fcc < Formula
  desc "Free Claude Code - AI coding assistant using Groq (free), OpenAI, or Gemini"
  homepage "https://github.com/albertgd/free-claude-code"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.4/fcc-macos-arm64"
      sha256 "d48ed29968ae5d20e6341754bc81393b3b2128d101d6bac2406c092ef21300d2"
    end
    on_intel do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.4/fcc-macos-x64"
      sha256 "6d8439dc3462ca1dcc9776c0348da5bb9e21bf3e3df2717e032f7c90fb1ab7ee"
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
