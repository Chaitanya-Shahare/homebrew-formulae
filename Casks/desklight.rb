cask "desklight" do
  version "0.1.0"
  sha256 "e10d854113ffc87e9fa577d4a532f504f2176d13e7186372354c05c1e0263bf4"

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
