class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.10.0/abacus_0.10.0_darwin_arm64.tar.gz"
      sha256 "44df2e7f8027e2c56894fee18cf1f30696c26cf47afcbbc6be7d5c13321a5735"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.10.0/abacus_0.10.0_darwin_amd64.tar.gz"
      sha256 "6f10af7ba6a5a3d55e4e869c81abe106b7f3d91d973712221a75362c94f78ae0"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.10.0/abacus_0.10.0_linux_arm64.tar.gz"
      sha256 "bf6cda6e7eba9795333326bc59e47b59a67de0e3da55fbe87b0ff02ab0a6e95e"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.10.0/abacus_0.10.0_linux_amd64.tar.gz"
      sha256 "ddb24e69ec2dee410df4e40d0481848c5d9144f8a6e29b34f022f5aa9e49e3d5"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
