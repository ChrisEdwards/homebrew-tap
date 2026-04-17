class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.10.1/abacus_0.10.1_darwin_arm64.tar.gz"
      sha256 "e1a724156daae64099ce1ce01bc79d4a8c68b7500d0a693cf7f80369d80ff46b"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.10.1/abacus_0.10.1_darwin_amd64.tar.gz"
      sha256 "9f835f81f24a17985b28aaf220bc07bbfcc93411c9de25e247627db6e524e3c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.10.1/abacus_0.10.1_linux_arm64.tar.gz"
      sha256 "3f05f956030496d6ccb2dce88543356a9194fcf2aa639e5d62d33042b69cf88c"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.10.1/abacus_0.10.1_linux_amd64.tar.gz"
      sha256 "d01ab7bb33fb8a78c149b3b4514e78cf4ee353f5a5c00861c3ea29810faa529c"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
