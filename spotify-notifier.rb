class SpotifyNotifier < Formula
  desc "A script that sends notifications for Spotify song changes."
  homepage "https://github.com/Chaitanya-Shahare/spotify-notifier"
  url "https://github.com/Chaitanya-Shahare/spotify-notifier/archive/v1.0.0.tar.gz"
  sha256 "f7959bcfc6ad13de7786c8d871a129901d786f39d2076060716394e89a71773a"

  depends_on "terminal-notifier" # Add any dependencies here

  def install
    bin.install "spotify-notifier.sh"
  end

  plist_options :startup => true

  def plist; <<-EOS
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
