class SpotifyNotifier < Formula
  desc "A script that sends notifications for Spotify song changes."
  homepage "https://github.com/Chaitanya-Shahare/spotify-notifier"
  url "https://github.com/Chaitanya-Shahare/spotify-notifier/archive/v1.0.3.tar.gz"
  sha256 "2f740c9edb78e146479a617091efabb72b0df4353bd4e311ae20b1996bf24575"
  head "https://github.com/Chaitanya-Shahare/spotify-notifier.git"

  depends_on "terminal-notifier"

  def install
    bin.install "spotify-notifier.sh" => "spotify-notifier"
  end

  def caveats
    <<~EOS
      The spotify-notifier script is installed, but you need to start it manually.
      You can start the script by running:
        ` nohup spotify-notifier > /dev/null & `
      You can also set the update interval by running:
        ` nohup spotify-notifier --update-interval 5 > /dev/null & `
      You can stop the script by running:
        ` kill $(ps aux | grep "spotify-notifier.sh" | awk '{print $2}') `
    EOS
  end

  test do
    system "#{bin}/spotify-notifier", "--version"
  end
end
