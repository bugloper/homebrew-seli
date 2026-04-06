class Seli < Formula
  desc "A CLI toolkit for managing deployments and release tags"
  homepage "https://github.com/bugloper/homebrew-seli"
  version "0.2.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.4/seli_0.2.4_darwin_amd64.tar.gz"
    sha256 "cce077d4ec1e3163835ca78ee14ef9881d60512cb3c76a17985d841a559dabbf"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.4/seli_0.2.4_darwin_arm64.tar.gz"
    sha256 "5efc144cf7fbca7bf16eb5923e4abeb6637cf9d83befd67336a34dcc07d9ca4f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.4/seli_0.2.4_linux_amd64.tar.gz"
    sha256 "d80212011415efb5bcc6c8c8e74af76f93c126bde514c07c0b4a3ca199312720"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.4/seli_0.2.4_linux_arm.tar.gz"
    sha256 "b7c1f6889c3891b2bf263de702814a0722b26da9ba58c31b7c84ece6149cf4de"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.4/seli_0.2.4_linux_arm64.tar.gz"
    sha256 "826f64d340a37ad8a882ec5dca96555f007270e60130d70435ccf3f94faad6ef"
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
