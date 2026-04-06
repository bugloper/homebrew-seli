class Seli < Formula
  desc "A CLI toolkit for managing deployments and release tags"
  homepage "https://github.com/bugloper/homebrew-seli"
  version "0.2.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.3/seli_0.2.3_darwin_amd64.tar.gz"
    sha256 "18c709de7e09825e8c946b91e31508bd2726cf7eeefcd76183aef28ea3ffc6c9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.3/seli_0.2.3_darwin_arm64.tar.gz"
    sha256 "8d1858a5daab2675335397e716e75fda17e142eee4a197460ea63e4682045d87"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.3/seli_0.2.3_linux_amd64.tar.gz"
    sha256 "aaa60aff79960acdc7cdf4f77c47fa1c938f751b32181a76584cf828fb53468e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.3/seli_0.2.3_linux_arm.tar.gz"
    sha256 "e44fc1dd2a3459a8acd59c5fa60a815138a5b7ef33c777b2bfae9e4c834da0bf"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.3/seli_0.2.3_linux_arm64.tar.gz"
    sha256 "07deab168515a1873e27e6c0ee1393aa3e5909511b86a84e4e73ac8bda079ed8"
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
