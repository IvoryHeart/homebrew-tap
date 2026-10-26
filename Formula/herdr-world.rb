class HerdrWorld < Formula
  desc "Visual IDE for AI agents with office, mindmaps and boards"
  homepage "https://herdr.world/"
  version "0.2.7"

  # Herdr World runs on Herdr. Where Homebrew bottles Herdr, depend on it;
  # Homebrew has no Intel Mac bottle, so there the Formula installs the
  # prebuilt Herdr release this World verified instead of building from source.
  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.7/herdr-world-v0.2.7-darwin-arm64.tar.xz"
      sha256 "4ea25ee4a7e0bcd095c8f8f76a6ddbe7d8b9794d33d976d966662bf2dd7b28c8"
      depends_on "herdr"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.7/herdr-world-v0.2.7-darwin-x64.tar.xz"
      sha256 "e1c81a6cd8c5fe692fe2ae198beb5c5e7f55fde9ca6599c6120208266ededbc3"

      resource "herdr" do
        url "https://github.com/herdrdev/herdr/releases/download/v0.9.5/herdr-macos-x86_64"
        sha256 "5fb0a908ec7f6745e3e245738b06bfad56c46391c391ab3c0955fbead01f1369"
      end
    end
  end

  on_linux do
    depends_on "herdr"

    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.7/herdr-world-v0.2.7-linux-arm64.tar.xz"
      sha256 "fc57d8526ce45c83924e955b8c3da61577ee1570206438802999914ebb99ac23"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.7/herdr-world-v0.2.7-linux-x64.tar.xz"
      sha256 "0e92d637964935f08dd54cee28cea1f821669a3c8abc6cb75d2e26857c6aa0ee"
    end
  end

  conflicts_with "herdr-world-rc", because: "both Formulae provide the herdr-world command"

  def install
    libexec.install "herdr-world", "VERSION",
      "LICENSE", "THIRD_PARTY_NOTICES.md",
      "DEPENDENCY_NOTICES.md", "DEPENDENCY_LICENSES.md",
      "UPSTREAM.md", "LICENSES"
    bin.install_symlink libexec/"herdr-world"
    install_prebuilt_herdr if OS.mac? && Hardware::CPU.intel?
  end

  def install_prebuilt_herdr
    resource("herdr").stage do
      (libexec/"herdr").install "herdr-macos-x86_64" => "herdr"
    end
    chmod 0755, libexec/"herdr/herdr"
    bin.install_symlink libexec/"herdr/herdr"
  end

  test do
    assert_match "herdr-world 0.2.7", shell_output("#{bin}/herdr-world --version")
  end
end
