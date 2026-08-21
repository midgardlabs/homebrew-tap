# MidgardLabs Homebrew Tap

This is the public third-party Homebrew Tap for MidgardLabs software. It is not part of the official Homebrew repositories.

## Fabre

After the first stable Cask is published:

```bash
brew tap midgardlabs/tap
brew install --cask midgardlabs/tap/fabre
```

Update an existing installation with:

```bash
brew update
brew upgrade --cask fabre
```

A normal uninstall preserves Fabre operator configuration and persistent state. Only use `--zap` when you intentionally want Homebrew to remove the Cask's declared user data:

```bash
brew uninstall --cask fabre
brew uninstall --cask --zap fabre
```

Product information and support: <https://fabre.app/>

## Maintenance

Casks live in the top-level `Casks/` directory required by Homebrew. Automated release pull requests are product-scoped through their title, branch, labels, and provenance-rich body. Every pull request must pass syntax, audit, public download, installation, Gatekeeper, and managed-runtime checks before merge.

The Gatekeeper check validates the installed executable itself with strict code-signature verification and Apple's online notarization-ticket requirement. This is suitable for Fabre's command-line Mach-O binary; it does not rely on `spctl` treating the executable as an application bundle.
