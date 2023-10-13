class SpotifyNotifier < Formula
  desc "A script that sends notifications for Spotify song changes."
  homepage "https://github.com/Chaitanya-Shahare/spotify-notifier"
  url "https://github.com/Chaitanya-Shahare/spotify-notifier/archive/v1.0.0.tar.gz"
  sha256 "85347f3e0805e913daa51063bbf2581f9f434c75ee88f787600ba1d963bc2ba2"
  head "https://github.com/Chaitanya-Shahare/spotify-notifier.git"

  depends_on "terminal-notifier"

  def install
    bin.install "spotify-notifier.sh" => "spotify-notifier"
  end

  service do
    run [opt_bin/"spotify-notifier"]
    keep_alive true
    run_type :immediate
  end

  test do
    system "#{bin}/spotify-notifier", "--version"
  end
end
