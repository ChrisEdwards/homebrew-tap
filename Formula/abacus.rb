class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.7.1/abacus_0.7.1_darwin_arm64.tar.gz"
      sha256 "05f3ffea7b05c970c17da7279415fa2ad8cf162f514e951bb93c4d5f1047d3d1"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.7.1/abacus_0.7.1_darwin_amd64.tar.gz"
      sha256 "3d97f1a45a8b9d49086caaf6357940ed26331552f73805aa5acbfa4ce87ccd76"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.7.1/abacus_0.7.1_linux_arm64.tar.gz"
      sha256 "3dab374b2f7272d03a1597150c57de4179905e348919b36d3e21950ed58f2dc8"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.7.1/abacus_0.7.1_linux_amd64.tar.gz"
      sha256 "878d6159ca0e972607cdbabbfa08a61a634a17090a7c5153e0f74c6b54d6d8e0"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
