class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.2.0/abacus_0.2.0_darwin_arm64.tar.gz"
      sha256 "d72b6e259c7517d579de703e468e8fa1dd85bf598bc11cd2a7a134ed01eded5f"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.2.0/abacus_0.2.0_darwin_amd64.tar.gz"
      sha256 "3cfe8be34de7b399fb3c03199f88b9079277073d8716adaaaefae4b369c78af5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.2.0/abacus_0.2.0_linux_arm64.tar.gz"
      sha256 "99cc30aaec3c77202519e9242611bd672f0452a1a965bc17ce263e72ca1dc058"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.2.0/abacus_0.2.0_linux_amd64.tar.gz"
      sha256 "7548c2349c21dac4d32bd3212473236f91ab962af6691a882bd31498d2014133"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
