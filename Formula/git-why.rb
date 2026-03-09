class GitWhy < Formula
  desc "The context layer for git"
  homepage "https://gitwhy.dev"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_arm64.tar.gz"
      sha256 "bf7b2db5afb54016c315ce3523900dd5527395ad441f62e8a285e0c502175cd1"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_amd64.tar.gz"
      sha256 "b563dda1e605e498207a848b04dbf980cf10ea1cf09442e912f074190f833c5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_arm64.tar.gz"
      sha256 "3f82241366c6a24fa8ba2b65279dd1f92d76476600aa9f2db51ecd3b31b3688d"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_amd64.tar.gz"
      sha256 "f43a640f00ae95487811a4d5baf7b519e18b1d983e3da29405924e850f94c736"
    end
  end

  def install
    bin.install "git-why"
  end

  def caveats
    <<~EOS
      To start using GitWhy, run:

        git why setup

      For more info: https://docs.gitwhy.dev
    EOS
  end

  test do
    system "#{bin}/git-why", "--version"
  end
end
