class GitWhy < Formula
  desc "The context layer for git"
  homepage "https://gitwhy.dev"
  version "0.7.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_arm64.tar.gz"
      sha256 "c30e25e2721cacecdb5eda42a2d2b9a313736e9e52df8a6d77262cf1ae8eb1de"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_amd64.tar.gz"
      sha256 "138ef4920c48349ec17dda6edde7f805236a62f379abc63e0c2cfdf34cb81308"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_arm64.tar.gz"
      sha256 "ba20c684a4ba9ccfba326c98f64b8f74e68f11292c9772438417de8aecc2d004"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_amd64.tar.gz"
      sha256 "205db572895fd59d928b2c2a47ddd612841dec52dc560874e2141d49de792325"
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
