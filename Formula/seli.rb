class Seli < Formula
  desc "A CLI toolkit for managing deployments and release tags"
  homepage "https://github.com/bugloper/homebrew-seli"
  version "0.2.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.3/seli_0.2.3_darwin_amd64.tar.gz"
    sha256 "43d8bcf28b61e9cdf2fbd4adb43d1a0c827d75220bf3ce6757b473857cd00b25"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.3/seli_0.2.3_darwin_arm64.tar.gz"
    sha256 "36622d650b437122c5d64bc18c7d11caca936e6d9d5e1853c0dd07a70625886e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.3/seli_0.2.3_linux_amd64.tar.gz"
    sha256 "3bdfae402513a3e31b378575357e979e212dc741b218e9b64fbbddb0f11acb3c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.3/seli_0.2.3_linux_arm.tar.gz"
    sha256 "69c0a42f198f0f2093a2823704be0ae06364cd2a4e94d775f90b583f0a2187bf"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.3/seli_0.2.3_linux_arm64.tar.gz"
    sha256 "d39d8861282e92118253aae7827d7f97c0038b61af3f97d7e3b20ab0d33f64fd"
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
