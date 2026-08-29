class HerdrWorldRc < Formula
  desc "Browser and mobile client for monitoring and controlling Herdr agents"
  homepage "https://ivoryheart.github.io/herdr-world/"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.13/herdr-world-v0.1.0-rc.13-macos-arm64.tar.gz"
      sha256 "0a7bf148a2a1debe9fa4947ade8702ba268f20008d9be45f9f856a4f4ee88ad8"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.13/herdr-world-v0.1.0-rc.13-macos-x86_64.tar.gz"
      sha256 "70fb522e28b7db3acd3183bd7fd76f0ee295c78ad62339af80e475ae0d9c95e6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.1.0-rc.13/herdr-world-v0.1.0-rc.13-linux-x86_64.tar.gz"
      sha256 "68aded50ec8a41766989676dceacd307eaa47fb6035d41194324277335f02127"
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
