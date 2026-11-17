cask "ytspot" do
  version "0.15.0"
  sha256 "dea5eee82ee8820c961354c17645650ded53454ac4eb9dd670aa265186dd9006"

  url "https://github.com/Chaitanya-Shahare/ytspot/releases/download/v#{version}/ytspot-mac-arm64.zip"
  name "ytspot"
  desc "YouTube Music client with a Spotify-style UI"
  homepage "https://github.com/Chaitanya-Shahare/ytspot"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ytspot.app"

  # The app is ad-hoc signed, not notarized, so Gatekeeper would block the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/ytspot.app"]
  end

  zap trash: [
    "~/Library/Application Support/ytspot",
    "~/Library/Preferences/com.chaitanya.ytspot.plist",
    "~/Library/Saved Application State/com.chaitanya.ytspot.savedState",
  ]
end
