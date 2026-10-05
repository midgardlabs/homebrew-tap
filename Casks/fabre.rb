cask "fabre" do
  version "0.74.0"
  sha256 "f7f41a43d9ffcaabf338da7c93820a5e4cf5f91c4178bfd37fce0e9d221fd5bc"

  url "https://releases.fabre.app/v#{version}/fabre-v#{version}-macos-arm64.tar.gz"
  name "Fabre"
  desc "Ragnarok Online server emulator"
  homepage "https://fabre.app/"

  livecheck do
    skip "Auto-generated on release"
  end

  depends_on arch: :arm64

  command_wrapper "fabre",
                  executable: "#{staged_path}/fabre-v#{version}-macos-arm64/fabre",
                  args:       ["--homebrew-cask"]

  zap trash: [
    "~/Library/Application Support/MidgardLabs/Fabre",
    "~/Library/Logs/MidgardLabs/Fabre",
  ]

  caveats <<~EOS
    Fabre keeps operator configuration and persistent state in:
      ~/Library/Application Support/MidgardLabs/Fabre
    Fabre keeps logs in:
      ~/Library/Logs/MidgardLabs/Fabre

    Stop every running Fabre server before upgrading.
    A normal uninstall preserves these directories. Use --zap only when you
    intentionally want to remove all Fabre operator data.
  EOS
end
