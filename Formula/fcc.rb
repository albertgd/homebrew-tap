class Fcc < Formula
  desc "Free Claude Code - AI coding assistant using Groq (free), OpenAI, or Gemini"
  homepage "https://github.com/albertgd/free-claude-code"
  version "1.0.13"

  on_macos do
    on_arm do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.13/fcc-macos-arm64"
      sha256 "58a79ef956c3e14f9d050128dd4bb0047fa274831027c2ecfc93d1bd639156a0"
    end
    on_intel do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.13/fcc-macos-x64"
      sha256 "d466ac5de21c6df07b8700c6450693442708bd46f3587e3705e8e42ee55dc12b"
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
