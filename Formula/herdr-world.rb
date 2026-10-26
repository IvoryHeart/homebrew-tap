class HerdrWorld < Formula
  desc "Visual IDE for AI agents with office, mindmaps and boards"
  homepage "https://herdr.world/"
  version "0.2.7"

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
    libexec.install "herdr-world", "VERSION",
      "LICENSE", "THIRD_PARTY_NOTICES.md",
      "DEPENDENCY_NOTICES.md", "DEPENDENCY_LICENSES.md",
      "UPSTREAM.md", "LICENSES"
    (bin/"herdr-world").write <<~SH
      #!/bin/sh
      set -eu
      world=#{(libexec/"herdr-world").to_s.shellescape}

      # Metadata and management commands keep their existing behavior. Only listener
      # startup needs the local runtime; remote/custom endpoints keep their own owner.
      bootstrap=0
      case "${1:-}" in
        --version|-V|--help|-h|--skill) ;;
        ""|-*) bootstrap=1 ;;
      esac
      for argument in "$@"; do
        case "$argument" in
          --version|-V|--help|-h|--skill|--ssh-host|--ssh-host=*|--socket-path|--socket-path=*|--client-socket-path|--client-socket-path=*|--session|--session=*) bootstrap=0 ;;
        esac
      done
      if [ -n "${HERDR_SSH_HOST:-}${HERDR_SOCKET_PATH:-}${HERDR_CLIENT_SOCKET_PATH:-}${HERDR_SESSION:-}" ]; then
        bootstrap=0
      fi
      if [ "$bootstrap" = 1 ] && [ "${HERDR_WORLD_SKIP_HERDR:-}" != 1 ]; then
        status="$("$world" herdr status)"
        case "$status" in
          'Herdr is not installed.'*)
            "$world" herdr upgrade --install --no-integrations --no-plugin
            ;;
        esac
      fi
      exec "$world" "$@"
    SH
    (bin/"herdr-world").chmod 0755
  end

  def caveats
    <<~EOS
      World reuses your existing Herdr. On first launch, if Herdr is missing,
      it installs the verified prebuilt release in ~/.local/bin, outside Homebrew.
      Existing Herdr installations are not upgraded. Add ~/.local/bin to PATH.
      Run herdr-world herdr setup to start Herdr as a user service.
    EOS
  end

  test do
    assert_match "herdr-world 0.2.7", shell_output("#{bin}/herdr-world --version")
    assert_match "Herdr", shell_output("#{bin}/herdr-world herdr status")
  end
end
