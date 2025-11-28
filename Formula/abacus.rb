class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.3.0/abacus_0.3.0_darwin_arm64.tar.gz"
      sha256 "46c6673d56235ada767e90d533b1ca271ffabe3b37c3475bc7b4e20a3235ea7b"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.3.0/abacus_0.3.0_darwin_amd64.tar.gz"
      sha256 "73a98ce63a6259436a08ecc8b2eed7687f74c0deeb32664c48f3074c877aaaf2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.3.0/abacus_0.3.0_linux_arm64.tar.gz"
      sha256 "98215a0eb84b35150b1ca22c3c1e06cb4283fc70ff9716cb7e111ef0a493997e"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.3.0/abacus_0.3.0_linux_amd64.tar.gz"
      sha256 "25fbbdd6a0fd753995566f123d51b952bd678433877a151e196bd03f30ce280c"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
