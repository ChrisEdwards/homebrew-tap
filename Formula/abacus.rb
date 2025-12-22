class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.6.0/abacus_0.6.0_darwin_arm64.tar.gz"
      sha256 "d9f432feb105c19108f3977efc0c9aabdfa9c760848592c86b3eff3d48c6658d"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.6.0/abacus_0.6.0_darwin_amd64.tar.gz"
      sha256 "e91c10f32776ba87a00dfbe9e42091df91618846a70298e68e25ac1ad436ea31"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.6.0/abacus_0.6.0_linux_arm64.tar.gz"
      sha256 "1ea8b1f40e9cba6b7459be0640f1efd04c2c3e3ad5efdd75087926b88519e08a"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.6.0/abacus_0.6.0_linux_amd64.tar.gz"
      sha256 "48cb2463353fbfcc6ae2103301889455e37905b53a2761c8256c856014324a06"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
