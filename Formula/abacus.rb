class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.4.0/abacus_0.4.0_darwin_arm64.tar.gz"
      sha256 "d0f1cb0e2467344a83be0eb0079b6812e58a74b5dec8e152eb776bd4c12681a5"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.4.0/abacus_0.4.0_darwin_amd64.tar.gz"
      sha256 "07732227bcc062f359fe897d8de510394c8e35d6eba269f3389890c87907fffa"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.4.0/abacus_0.4.0_linux_arm64.tar.gz"
      sha256 "f17dbdf18b11cab60118c628b0661222f444a587dc29dfca8ab7f386943c2a57"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.4.0/abacus_0.4.0_linux_amd64.tar.gz"
      sha256 "2b522f73e67365dadcfa6d5d366d542a129e29038fcd3544fdc73dcadfdbb499"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
