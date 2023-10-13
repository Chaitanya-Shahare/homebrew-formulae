class SpotifyNotifier < Formula
  desc "A script that sends notifications for Spotify song changes."
  homepage "https://github.com/Chaitanya-Shahare/spotify-notifier"
  url "https://github.com/Chaitanya-Shahare/spotify-notifier/archive/v1.0.2.tar.gz"
  sha256 "d0c2ceec6237529e15fba7f3b5370b3407ce7de4b532e72edc40723434270494"
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
