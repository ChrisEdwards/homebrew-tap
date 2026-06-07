class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.11.0/abacus_0.11.0_darwin_arm64.tar.gz"
      sha256 "db419cbe954b6a5f8b2cd1150a66c3da8e8f525a09637b759e27cab117e6c77d"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.11.0/abacus_0.11.0_darwin_amd64.tar.gz"
      sha256 "0010a2cafa0fd195119c54f8bfeb58a36775196f421f4f125a3172e650478bd3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.11.0/abacus_0.11.0_linux_arm64.tar.gz"
      sha256 "5ab6c1481b75c1e3ac255cf15cf1edfed1fc82f6becdff672f2ab87fec6ac041"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.11.0/abacus_0.11.0_linux_amd64.tar.gz"
      sha256 "41559697da3a4f92edeca85b6df9f868874fbc2913cd26b9c7fbbb06e78dffaa"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
