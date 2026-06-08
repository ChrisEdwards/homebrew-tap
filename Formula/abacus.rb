class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.11.1/abacus_0.11.1_darwin_arm64.tar.gz"
      sha256 "9be0892aae0c7ef87311043b9fae79eb435752c406bb8816113d1ed8e199ac0b"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.11.1/abacus_0.11.1_darwin_amd64.tar.gz"
      sha256 "49dc2796152be671bb7327e8f95b4437d00383c0f0570908d91071483a06d266"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.11.1/abacus_0.11.1_linux_arm64.tar.gz"
      sha256 "c1384592718285e7b108dec5a9b50d9fd67733142ca342790f7794ac9705329e"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.11.1/abacus_0.11.1_linux_amd64.tar.gz"
      sha256 "9451b440cebf1ac0b8c26e3b11439d91f2a55a160438e0c8cf133a9903ddecbf"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
