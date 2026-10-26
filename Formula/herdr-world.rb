class HerdrWorld < Formula
  desc "Visual IDE for AI agents with office, mindmaps and boards"
  homepage "https://herdr.world/"
  version "0.2.7"

  # Herdr retains its own Homebrew owner, including on Intel Macs where
  # Homebrew may build it from source instead of pouring a bottle.
  depends_on "herdr"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.7/herdr-world-v0.2.7-darwin-arm64.tar.xz"
      sha256 "4ea25ee4a7e0bcd095c8f8f76a6ddbe7d8b9794d33d976d966662bf2dd7b28c8"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.2.7/herdr-world-v0.2.7-darwin-x64.tar.xz"
      sha256 "e1c81a6cd8c5fe692fe2ae198beb5c5e7f55fde9ca6599c6120208266ededbc3"
    end
  end

  on_linux do
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
    herdr_output = Utils.safe_popen_read(Formula["herdr"].opt_bin/"herdr", "--version")
    herdr_version = herdr_output[/^herdr ([0-9]+[.][0-9]+[.][0-9]+)/, 1]
    if herdr_version.nil? || Version.new(herdr_version) < Version.new("0.9.5")
      odie "Herdr 0.9.5 or newer is required; run brew update && brew upgrade herdr, then retry."
    end
    libexec.install "herdr-world", "VERSION",
      "LICENSE", "THIRD_PARTY_NOTICES.md",
      "DEPENDENCY_NOTICES.md", "DEPENDENCY_LICENSES.md",
      "UPSTREAM.md", "LICENSES"
    bin.install_symlink libexec/"herdr-world"
  end

  test do
    assert_match "herdr-world 0.2.7", shell_output("#{bin}/herdr-world --version")
    herdr_output = shell_output("#{Formula["herdr"].opt_bin}/herdr --version")
    assert_match /^herdr /, herdr_output
    assert_operator Version.new(herdr_output[/[0-9]+[.][0-9]+[.][0-9]+/]), :>=,
                    Version.new("0.9.5")
  end
end
