class GitWhy < Formula
  desc "The context layer for git"
  homepage "https://gitwhy.ai"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_arm64.tar.gz"
      sha256 "440f4a69bdfaf70fa041709f027b36f702648501da4309819481f8e719540be4"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_amd64.tar.gz"
      sha256 "698ad08fe59c80683af22f785e8dc071fbcf78cc94192df1bc801c70ed4daaf0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_arm64.tar.gz"
      sha256 "2e40cf5dbf7603059777905f4003892c1da0e850f9a873e0d1ce69b17a3fd067"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_amd64.tar.gz"
      sha256 "29f4c47e9c9dc23d08c4bd9686daadb6643756d3f783ee93deffd31b8c4d7928"
    end
  end

  def install
    bin.install "git-why"
  end

  def caveats
    <<~EOS
      To start using GitWhy, set up your repository:

        cd /path/to/your/repo
        git why setup

      For more info: https://gitwhy.ai
    EOS
  end

  test do
    system "#{bin}/git-why", "--version"
  end
end
