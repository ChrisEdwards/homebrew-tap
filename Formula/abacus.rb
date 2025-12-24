class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.6.1/abacus_0.6.1_darwin_arm64.tar.gz"
      sha256 "5473f5d21cf7d13380ac3abe6fb9a468ccba8ec4883bed47e36d97c92f6bda14"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.6.1/abacus_0.6.1_darwin_amd64.tar.gz"
      sha256 "16c3e69ee2c258d315e2cf533fbde67f1316ddd94862538f42f65b343f906ed7"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.6.1/abacus_0.6.1_linux_arm64.tar.gz"
      sha256 "1dda09ece79ff83f28bd6f5565ee7c7cf2d44ee98213840bc433d774186924a1"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.6.1/abacus_0.6.1_linux_amd64.tar.gz"
      sha256 "3a95f4d12c482b383644a3e7372cb7de15a777e4748d6562930439dee3d78f56"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
