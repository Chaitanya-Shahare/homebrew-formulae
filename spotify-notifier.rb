class SpotifyNotifier < Formula
  desc "A script that sends notifications for Spotify song changes."
  homepage "https://github.com/Chaitanya-Shahare/spotify-notifier"
  url "https://github.com/Chaitanya-Shahare/spotify-notifier/archive/v1.0.0.tar.gz"
  sha256 "09a901d0025d313c0ee0915db9dd0ae3b81a61985e0128d0dbe14a744f41fbc6"

  depends_on "terminal-notifier" # Add any dependencies here

  def install
    bin.install "spotify-notifier.sh"
  end

  def plist
    <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>homebrew.mxcl.spotify-notifier</string>
      <key>ProgramArguments</key>
      <array>
        <string>/usr/local/bin/spotify-notifier.sh</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <true/>
    </dict>
    </plist>
    EOS
  end

  test do
    # Add some test cases if necessary
  end
end
