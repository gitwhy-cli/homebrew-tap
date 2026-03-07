class GitWhy < Formula
  desc "The context layer for git"
  homepage "https://gitwhy.ai"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_arm64.tar.gz"
      sha256 "1acf61029fc92c021dd7ae6eaaa98afc849014b1536fd7caaa97bb4c4ffd4045"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_amd64.tar.gz"
      sha256 "ca029e7e328b44ca083e59e96a22a34c3f5b45c5a3a1960958a962487878176d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_arm64.tar.gz"
      sha256 "67cc869297eb45e768c57182b855d6ad66df993fff644f65a70bdb33c276b013"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_amd64.tar.gz"
      sha256 "86a3e94417b6a50bec37a683532928852b01c7bfcd8f1e35a0b5aac4cc2183d7"
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
