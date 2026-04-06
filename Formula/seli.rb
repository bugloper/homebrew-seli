class Seli < Formula
  desc "A CLI toolkit for managing deployments and release tags"
  homepage "https://github.com/bugloper/homebrew-seli"
  version "0.2.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.1/seli_0.2.1_darwin_amd64.tar.gz"
    sha256 "8d31b1e907ff8c805d710455ce5f35a4848acd69486f33b5da77267c72cd0f88"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.1/seli_0.2.1_darwin_arm64.tar.gz"
    sha256 "31df09f77a4a84a6478161ec91daa3f8c70fb1f38ffd8e6cc67c3ccb4a2ad938"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.1/seli_0.2.1_linux_amd64.tar.gz"
    sha256 "a815ee1d67d775320af16c4dcb4734a84281973b17fba97ddf42679efd9cad88"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.1/seli_0.2.1_linux_arm.tar.gz"
    sha256 "b6ce77885608f86003d6bad2ab8bcc7c84c6215008adc6e417ef85b3a70b2ec3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.1/seli_0.2.1_linux_arm64.tar.gz"
    sha256 "5ea31b2b8ac8e325f0929bb1a76cc1124031130f4e0bf7013cf47d51b8048844"
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
