cask "desklight" do
  version "0.2.0"
  sha256 "afb7756c98684ca183c13c2667a351f933691daf3452894d646ae56bab7f1f82"

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
