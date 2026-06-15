class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.12.0/abacus_0.12.0_darwin_arm64.tar.gz"
      sha256 "337ef30c056caf04583d51816b0a7a5afa10bd9dee7e8a2bab825cc8ca8f27c5"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.12.0/abacus_0.12.0_darwin_amd64.tar.gz"
      sha256 "256d0b9a8a9f45d3226f518e82d7037170d94889a8a022a9230eac1bae8c50df"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.12.0/abacus_0.12.0_linux_arm64.tar.gz"
      sha256 "0aa5c244ca7d6d55ba4b85d877f1c77f4b0cd3b638d15e1135f988908e5c953c"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.12.0/abacus_0.12.0_linux_amd64.tar.gz"
      sha256 "66e1b6740a4e47e278f6bfa53dc13ad27eaa81f390944e478beb8f76e9c44835"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
