class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.8.0/abacus_0.8.0_darwin_arm64.tar.gz"
      sha256 "99f964cc868130daeac0b3c508b0039f4dd0bc7540517cd0ebc3a656d06a498e"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.8.0/abacus_0.8.0_darwin_amd64.tar.gz"
      sha256 "3b170f40df3631188e017cde47bde44809da7ccfae6edeb667507d686a39bdc3"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.8.0/abacus_0.8.0_linux_arm64.tar.gz"
      sha256 "a1099cef365bf345101cf4ce4110c0f221febefb326770a5a6131590c8933302"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.8.0/abacus_0.8.0_linux_amd64.tar.gz"
      sha256 "5ce49e37aeba75a91af94659dee6872e2466444467717163e6d39464a0ab1a05"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
