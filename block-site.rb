class BlockSite < Formula
  desc "Script to block and unblock websites by modifying /etc/hosts"
  homepage "https://github.com/yourusername/block-site"
  url "https://github.com/Chaitanya-Shahare/block-site/archive/v1.0.0.tar.gz"
  sha256 "522bb30562f3d5b5a8b15ac4e5f8b2392544f64908e1ec20c7ac456c03574e0a"
  version "1.0.0"

  def install
    bin.install "block_site.sh" => "block-site"
  end

  def caveats
    <<~EOS
      This script requires sudo privileges to modify the /etc/hosts file.
      Use it as follows:
      - Block a site: block-site --block domain.com
      - Unblock a site: block-site --unblock domain.com
    EOS
  end
end
