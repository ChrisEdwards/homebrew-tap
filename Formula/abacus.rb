class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.2.0/abacus_0.2.0_darwin_arm64.tar.gz"
      sha256 "59a357d9a55a37df60cb41bad05fe9b01c6cbc70b6dc751b1016f05109911694"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.2.0/abacus_0.2.0_darwin_amd64.tar.gz"
      sha256 "4531d1f8913cfbfb2a82f2e6ad40cc8eb8ac55a3e229ea683f6922cdfefb4aaa"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.2.0/abacus_0.2.0_linux_arm64.tar.gz"
      sha256 "e81302c078a2efa5f1f53db836a958dad81682c78ae343e51caa4f5f606535c6"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.2.0/abacus_0.2.0_linux_amd64.tar.gz"
      sha256 "753864e0e34f27dc53bc4f239390e58b5de234716d48ba56fcb3d90b2745aeeb"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
