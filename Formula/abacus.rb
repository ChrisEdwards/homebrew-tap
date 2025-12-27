class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.7.0/abacus_0.7.0_darwin_arm64.tar.gz"
      sha256 "b1cdb59ca38ef679936880939cd7fe4811bc85c89912088273893716c3ea841e"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.7.0/abacus_0.7.0_darwin_amd64.tar.gz"
      sha256 "ca242aba7925b7ab2b0193397d12d0c070e5add1cf2bfd51c5fc6e3d87495559"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.7.0/abacus_0.7.0_linux_arm64.tar.gz"
      sha256 "f1e74b0311178255bf0b15295777aa7bcdf73855e69045600da4ba252325a862"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.7.0/abacus_0.7.0_linux_amd64.tar.gz"
      sha256 "e514e679a60ad96e6050c32acd322e23c987f5948e8ec7ed6845dffb5e416259"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
