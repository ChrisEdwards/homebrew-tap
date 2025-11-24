class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.1.0/abacus_0.1.0_darwin_arm64.tar.gz"
      sha256 "614d6042a216d2ec6e8786b9937b129c5a8b02b5d1eecf5476f940eb338c6111"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.1.0/abacus_0.1.0_darwin_amd64.tar.gz"
      sha256 "38bfc1114ca717a2e45dbca41eb37c071be23edda1f1b983780890c51c24474c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.1.0/abacus_0.1.0_linux_arm64.tar.gz"
      sha256 "546d7b3758146b650bdbfb6ca632dc6b86eaa5f556e60511f4d4d10e6de1e011"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.1.0/abacus_0.1.0_linux_amd64.tar.gz"
      sha256 "6458fc5871b8855198415dbfc18c1c74bb2818b083d75a183cac492286a7350a"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
