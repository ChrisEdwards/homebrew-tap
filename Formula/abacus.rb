class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.9.0/abacus_0.9.0_darwin_arm64.tar.gz"
      sha256 "d135ea3b07d0809a2cb21a0d56a5767e1c5cb19e2deb20cce0e0c0e0f649f28a"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.9.0/abacus_0.9.0_darwin_amd64.tar.gz"
      sha256 "72bde0c068d41ae769e72bd8c727127ee9a99e009789563434d23769c9de7e4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.9.0/abacus_0.9.0_linux_arm64.tar.gz"
      sha256 "46e3ba447a916091f60d0d91d6d513c7f9d29d0067f4ba67d32e5743cc8d8c81"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.9.0/abacus_0.9.0_linux_amd64.tar.gz"
      sha256 "264f06b3d9a2d1e415d9d5ae96fbe6bf0fd402a5f238e991602c7290a2cf514e"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
