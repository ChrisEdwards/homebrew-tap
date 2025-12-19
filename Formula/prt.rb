class Prt < Formula
  desc "Aggregate GitHub PR status across multiple local repositories"
  homepage "https://github.com/ChrisEdwards/pr-tracker"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ChrisEdwards/pr-tracker/releases/download/v0.2.0/prt-darwin-arm64"
      sha256 "0c180a75e72ad80a74283dc55ec43201a34560dccb3e01cae2734d8d8f9cdf7d"
    end
    on_intel do
      url "https://github.com/ChrisEdwards/pr-tracker/releases/download/v0.2.0/prt-darwin-amd64"
      sha256 "5f0ed2982bafbd19385820e76968815a0ea40c02f36f1e23cd2328a7f14870f9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ChrisEdwards/pr-tracker/releases/download/v0.2.0/prt-linux-amd64"
      sha256 "b2f69068895fe5deac6192dba8c4666b5c6868b9d56879e1378f20fe46cfa8af"
    end
  end

  depends_on "gh"

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "prt-darwin-arm64" => "prt"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "prt-darwin-amd64" => "prt"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "prt-linux-amd64" => "prt"
    end
  end

  test do
    assert_match "prt version", shell_output("#{bin}/prt --version")
  end
end
