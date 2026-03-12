class GitWhy < Formula
  desc "The context layer for git"
  homepage "https://gitwhy.dev"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_arm64.tar.gz"
      sha256 "bb3d735dba9773a3e9631a8ae0f5384b4ffe3505552a248971ff2e427e0741f3"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_darwin_amd64.tar.gz"
      sha256 "d7dbf98144e47dc38b8de547a94e490103afa99cfe07e210c6c25f46daa90890"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_arm64.tar.gz"
      sha256 "179dd7b603d35e29654c27a4213daf5a0b87db5ff6bd8781e2945a7b7711716b"
    else
      url "https://dl.gitwhy.dev/v#{version}/gitwhy_#{version}_linux_amd64.tar.gz"
      sha256 "3328cbf8e4d192fd93fcb5807a762f005a38b0290e43ea440016290fb307c6b2"
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
