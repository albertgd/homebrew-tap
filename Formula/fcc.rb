class Fcc < Formula
  desc "Free Claude Code - AI coding assistant using Groq (free), OpenAI, or Gemini"
  homepage "https://github.com/albertgd/free-claude-code"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.1/fcc-macos-arm64"
      sha256 "95d9be35a26214c0ff35097303b2a01db5da590d4fb629c1c9d58dec61faeaff"
    end
    on_intel do
      url "https://github.com/albertgd/free-claude-code/releases/download/v1.0.1/fcc-macos-x64"
      sha256 "f8bbce4ddc793159b33aaea84ed811411df82ace967d93c5cc83ac96fd04d7b6"
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
