class SpotifyNotifier < Formula
  desc "A script that sends notifications for Spotify song changes."
  homepage "https://github.com/Chaitanya-Shahare/spotify-notifier"
  url "https://github.com/Chaitanya-Shahare/spotify-notifier/archive/v1.0.3.tar.gz"
  sha256 "d0c2ceec6237529e15fba7f3b5370b3407ce7de4b532e72edc40723434270494"
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
