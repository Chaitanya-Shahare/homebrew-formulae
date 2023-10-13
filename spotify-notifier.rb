class SpotifyNotifier < Formula
  desc "A script that sends notifications for Spotify song changes."
  homepage "https://github.com/Chaitanya-Shahare/spotify-notifier"
  url "https://github.com/Chaitanya-Shahare/spotify-notifier/archive/v1.0.0.tar.gz"
  sha256 "f7959bcfc6ad13de7786c8d871a129901d786f39d2076060716394e89a71773a"
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
end
