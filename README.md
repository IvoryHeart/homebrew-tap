# homebrew-tap

Homebrew tap for IvoryHeart desktop applications.

## Herdr World

Install Herdr World with `brew install IvoryHeart/tap/herdr-world`.
World reuses an existing Herdr from your normal environment, including a standalone
or Homebrew installation. On first normal local World launch, a missing Herdr is
installed as a verified prebuilt binary in `~/.local/bin`, outside the World keg.
No mandatory Herdr formula or Intel source build is needed. Add `~/.local/bin` to
`PATH` for direct Herdr commands; run `herdr-world herdr setup` to start its user
service. Installation preserves an existing runtime's version and owner.

If automatic setup fails, World still starts so remote profiles and in-app setup
remain available. Retry with `herdr-world herdr upgrade --install`. A broken link
or non-executable entry at Herdr's default path is reported before downloading;
repair that entry before retrying. The selected entry must be a regular executable
file, even when status labels it installed. A reachable Herdr server is reused
when its executable is outside the shell's path.

Metadata and management commands do not trigger bootstrap. Set
`HERDR_WORLD_SKIP_HERDR=1` to skip it for a normal launch. Update Herdr explicitly
through its installation owner, and update World with `brew upgrade herdr-world`.
