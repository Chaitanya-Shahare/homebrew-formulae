cask "desklight" do
  version "0.3.0"
  sha256 "c906e432b836116e325e381f40846d0dc902aebc472589bc40c9cd4d40772d72"

  url "https://github.com/Chaitanya-Shahare/desklight/releases/download/v#{version}/DeskLight-#{version}.zip"
  name "DeskLight"
  desc "Menu bar controller for LED LAMP Bluetooth desk lights"
  homepage "https://github.com/Chaitanya-Shahare/desklight"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "DeskLight.app"

  # The app is self-signed, not notarized, so Gatekeeper would block the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/DeskLight.app"]
  end

  uninstall quit: "com.chaitanyashahare.desklight"

  zap trash: [
    "~/Library/Application Support/DeskLight",
    "~/Library/Logs/DeskLight-diagnose.log",
    "~/Library/Logs/DeskLight.log",
    "~/Library/Preferences/com.chaitanyashahare.desklight.plist",
  ]

  caveats <<~EOS
    Open DeskLight from Applications, allow Bluetooth, then click the lightbulb in the menu bar.
    Close the LED LAMP phone app first: the lamp accepts one connection at a time.
  EOS
end
