class Abacus < Formula
  desc "TUI viewer for Beads issue tracking"
  homepage "https://github.com/ChrisEdwards/abacus"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.5.0/abacus_0.5.0_darwin_arm64.tar.gz"
      sha256 "324a7c12c5a2258543404a4b9543caa412ac77e63a1c27028ccba1a450365893"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.5.0/abacus_0.5.0_darwin_amd64.tar.gz"
      sha256 "13938ab3e717b9983efdccb58924b35d2e13e9a592e2f06f8a80119594f0feae"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.5.0/abacus_0.5.0_linux_arm64.tar.gz"
      sha256 "448f58ed376da8184958dd5291ebe6afd982f65989a4e7341f66a8479d320025"
    elsif Hardware::CPU.intel?
      url "https://github.com/ChrisEdwards/abacus/releases/download/v0.5.0/abacus_0.5.0_linux_amd64.tar.gz"
      sha256 "cb32d0b0f47c288c10039feae2ac0480ef8773797a8a63ed3b8601006fa6d632"
    end
  end

  def install
    bin.install "abacus"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/abacus --version")
  end
end
