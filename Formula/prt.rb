class Prt < Formula
  desc "Aggregate GitHub PR status across multiple local repositories"
  homepage "https://github.com/ChrisEdwards/pr-tracker"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ChrisEdwards/pr-tracker/releases/download/v0.1.0/prt-darwin-arm64"
      sha256 "b98d181430623a3ebca5b6e6015108cd413b98b80935145d00b5ba746cbbd140"
    end
    on_intel do
      url "https://github.com/ChrisEdwards/pr-tracker/releases/download/v0.1.0/prt-darwin-amd64"
      sha256 "7438c0fdd22431a7ce8cbadd492e95d351fbe9c8ea869d1268140cc448b0f8ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ChrisEdwards/pr-tracker/releases/download/v0.1.0/prt-linux-amd64"
      sha256 "e7c87bff84322b018276546a508e31e34bde6fbbe6e1e3bdb7a38ebd1fb4d7e0"
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
