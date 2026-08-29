class HerdrWorldRc < Formula
  desc "Browser and mobile client for monitoring and controlling Herdr agents"
  homepage "https://ivoryheart.github.io/herdr-world/"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.12/herdr-world-v0.1.0-rc.12-macos-arm64.tar.gz"
      sha256 "b1647db700d8950bd0c856b5b94538fd0e7f9925ac3f090ee7fe511942768d67"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.12/herdr-world-v0.1.0-rc.12-macos-x86_64.tar.gz"
      sha256 "ee4caf4fe3284287ed87c90aa2d385d0755f790b005a03d5eb985f9fc07b09de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.12/herdr-world-v0.1.0-rc.12-linux-x86_64.tar.gz"
      sha256 "f2453945020edadd95f6cb6d0b05a54462b15634c146bd98ea0e0af86fc35e9c"
    end
  end

  conflicts_with "herdr-world", because: "both Formulae provide the herdr-world command"

  def install
    libexec.install "VERSION", "bin", "share", "docs", "vendor",
      "third_party", "LICENSE", "THIRD_PARTY_NOTICES.md", "UPSTREAM.md",
      "README.md", "install"
    bin.install_symlink libexec/"bin/herdr-world"
  end

  test do
    system bin/"herdr-world", "--help"
  end
end
