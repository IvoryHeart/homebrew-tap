class HerdrWorldRc < Formula
  desc "Visual IDE for AI agents with office, mindmaps and boards"
  homepage "https://herdr.world/"
  version "0.3.0-rc.1"

  on_macos do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.3.0-rc.1/herdr-world-v0.3.0-rc.1-darwin-arm64.tar.xz"
      sha256 "cfcf55519b4fe56d4fddcb012d3695d2f1e6921339be9c05a2fed874cb5d7342"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.3.0-rc.1/herdr-world-v0.3.0-rc.1-darwin-x64.tar.xz"
      sha256 "143d57f54fa707b2276b1d8f7160fafc8e3bd84c05b5894daf30cc6f0ae44da1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.3.0-rc.1/herdr-world-v0.3.0-rc.1-linux-arm64.tar.xz"
      sha256 "bbd4a44e0cbbfdd46d8fadd8079d030542bdccaa968b1f7c939995d77da8e1e8"
    end
    on_intel do
      url "https://github.com/IvoryHeart/herdr-world/releases/download/v0.3.0-rc.1/herdr-world-v0.3.0-rc.1-linux-x64.tar.xz"
      sha256 "2dce289c41401aea42e857de1a651b7e477061b1c74ffdfed292d8535af858e1"
    end
  end

  conflicts_with "herdr-world", because: "both Formulae provide the herdr-world command"

  def install
    libexec.install "herdr-world", "VERSION",
      "LICENSE", "THIRD_PARTY_NOTICES.md",
      "DEPENDENCY_NOTICES.md", "DEPENDENCY_LICENSES.md",
      "UPSTREAM.md", "LICENSES"
    (bin/"herdr-world").write <<~SH
      #!/bin/sh
      set -eu
      world=#{(libexec/"herdr-world").to_s.shellescape}

      # A published World binary may predate missing-only CLI support. Keep this Unix
      # compatibility path independent of its upgrade command, with atomic publication.
      # A status result is presence evidence only when its selected file is executable.
      # Keep the running-server state independent of binary discovery.
      check_herdr_presence() {
        herdr_status="$("$world" herdr status)" || return 1
        IFS= read -r herdr_status_line <<EOF || return 1
      $herdr_status
      EOF
        case "$herdr_status_line" in
          'Herdr is not installed.') herdr_missing=1 ;;
          'Herdr is running ('*) herdr_missing=0 ;;
          'Herdr is installed but not running: '*)
            herdr_candidate="${herdr_status_line#Herdr is installed but not running: }"
            if [ ! -f "$herdr_candidate" ] || [ ! -x "$herdr_candidate" ]; then
              printf 'Herdr installation blocked by non-executable entry: %s; repair it before retrying.\n' "$herdr_candidate" >&2
              return 1
            fi
            herdr_missing=0
            ;;
          *) return 1 ;;
        esac
      }

      install_missing_herdr() (
        check_herdr_presence || return 1
        [ "$herdr_missing" = 1 ] || return 0
        install_dir="${HERDR_INSTALL_DIR:-$HOME/.local/bin}"
        if [ -e "$install_dir/herdr" ] || [ -L "$install_dir/herdr" ]; then
          if [ -f "$install_dir/herdr" ] && [ -x "$install_dir/herdr" ]; then return 0; fi
          printf 'Herdr installation blocked by non-executable entry: %s; repair it before retrying.\n' "$install_dir/herdr" >&2
          return 1
        fi
        case "$(uname -s):$(uname -m)" in
          Linux:x86_64|Linux:amd64) target=linux-x86_64; expected=14d9e8bc8b4a9e0118d77c32266f76d461f09b40342eb23752960bd89f59929d ;;
          Linux:aarch64|Linux:arm64) target=linux-aarch64; expected=17d7536f2da50859523680ef279dffcac8e4a235f4e46fe8da6c2ec44141897c ;;
          Darwin:x86_64|Darwin:amd64) target=macos-x86_64; expected=5fb0a908ec7f6745e3e245738b06bfad56c46391c391ab3c0955fbead01f1369 ;;
          Darwin:arm64|Darwin:aarch64) target=macos-aarch64; expected=fb77c2232a05a8035421382c894392f4174e4e38a18e48af3dd0290157c3a7e2 ;;
          *) return 1 ;;
        esac
        mkdir -p "$install_dir" || return 1
        staging="$(mktemp -d "$install_dir/.herdr.XXXXXXXX")" || return 1
        trap 'rm -rf "$staging"' 0
        trap 'exit 1' HUP INT TERM
        curl -fsSL --proto '=https' --proto-redir '=https' --max-time 120 -o "$staging/herdr" "https://github.com/herdrdev/herdr/releases/download/v0.9.5/herdr-$target" || return 1
        if command -v shasum >/dev/null 2>&1; then
          actual="$(shasum -a 256 "$staging/herdr" | awk '{print $1}')"
        else
          actual="$(sha256sum "$staging/herdr" | awk '{print $1}')"
        fi
        [ "$actual" = "$expected" ] || return 1
        chmod 755 "$staging/herdr" || return 1
        version="$("$staging/herdr" --version)" || return 1
        [ "$version" = 'herdr 0.9.5' ] || return 1
        # Recheck every discovery path after download; publication below still refuses
        # an entry created at the destination after this check, including symlinks.
        check_herdr_presence || return 1
        [ "$herdr_missing" = 1 ] || return 0
        if ln "$staging/herdr" "$install_dir/" 2>/dev/null; then
          printf '%s\n' 'Installed Herdr 0.9.5.'
        elif [ ! -f "$install_dir/herdr" ] || [ ! -x "$install_dir/herdr" ]; then
          printf 'Herdr installation blocked by non-executable entry: %s; repair it before retrying.\n' "$install_dir/herdr" >&2
          return 1
        fi
      )

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
      warn_bootstrap() {
        printf '%s\n' 'Herdr World: Herdr check or installation failed; starting World anyway. Retry with `herdr-world herdr upgrade --install`, or set HERDR_WORLD_SKIP_HERDR=1 to skip automatic setup.' >&2
      }
      if [ "$bootstrap" = 1 ] && [ "${HERDR_WORLD_SKIP_HERDR:-}" != 1 ]; then
        if ! install_missing_herdr; then
          warn_bootstrap
        fi
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
      If automatic setup fails, World still starts. Retry with
      herdr-world herdr upgrade --install, or set HERDR_WORLD_SKIP_HERDR=1.
      Run herdr-world herdr setup to start Herdr as a user service.
    EOS
  end

  test do
    assert_match "herdr-world 0.3.0-rc.1", shell_output("#{bin}/herdr-world --version")
    assert_match "Herdr", shell_output("#{bin}/herdr-world herdr status")
  end
end
