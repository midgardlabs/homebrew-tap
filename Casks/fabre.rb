cask "fabre" do
  version "0.67.1"
  sha256 "6bfaa54fa639d89fd1f0e0d6f9d4db9a0f481bfb472d0505600d180302425d20"

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
