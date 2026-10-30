cask "ytspot" do
  version "0.3.0"
  sha256 "c74422502d2f793f3f4c393f4060654aad3dc03331e2480435d61227391deab3"

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
