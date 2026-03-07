class GitWhy < Formula
  desc "The context layer for git"
  homepage "https://gitwhy.ai"
  version "0.2.0-rc.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_arm64.tar.gz"
      sha256 "fd063622dde2381038b774f6fcf74752cc9b5dd2122576d0258853bdbcc5b765"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_amd64.tar.gz"
      sha256 "0d48b4642405d01eb4c666954ff6ae4aab8805d661bcfa1cfcafd87f8427582b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_arm64.tar.gz"
      sha256 "7b0fca8d96f7039186fc89d854fc7d1a547a1c0d63c9a223597221892623cad1"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_amd64.tar.gz"
      sha256 "238ef0264dc84c6d27e5ef4326d461d26f040e325f48e7f0a5c0c1c47a3cb7e8"
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
