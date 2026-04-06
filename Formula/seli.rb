class Seli < Formula
  desc "A CLI toolkit for managing deployments and release tags"
  homepage "https://github.com/bugloper/homebrew-seli"
  version "0.2.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.6/seli_0.2.6_darwin_amd64.tar.gz"
    sha256 "ad4f3091b961a90497ab9b16b3a397907afe74db5572e8a75fdd89cdabb9b59a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.6/seli_0.2.6_darwin_arm64.tar.gz"
    sha256 "40351b07a3694ef81c48c713b660f02d2f8492ec03125658ae0308ec89c3b0b3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.6/seli_0.2.6_linux_amd64.tar.gz"
    sha256 "0077a8a9aa79673a725f1634cb97df986ac9fba6b45643f283c4d61a05652a09"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.6/seli_0.2.6_linux_arm.tar.gz"
    sha256 "b95b97669986d2f8a408c542a3ce639c4437762a9c73680220d661f55993c219"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.6/seli_0.2.6_linux_arm64.tar.gz"
    sha256 "415bd351588cf921846496473a1ea2a2ddb364587d9ce1de0f4c5f7c9ec6bc8d"
  end

  def install
    system "tar", "-xzf", cached_download, "-C", buildpath

    extracted_files = Dir[buildpath/"*"]
    if extracted_files.empty?
      odie "No files found in the extracted tarball"
    end

    extracted_files.each do |file|
      if File.file?(file)
        bin.install file => "seli"
        break
      end
    end
  end
end
