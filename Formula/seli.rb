class Seli < Formula
  desc "A CLI toolkit for managing deployments and release tags"
  homepage "https://github.com/bugloper/homebrew-seli"
  version "0.2.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.7/seli_0.2.7_darwin_amd64.tar.gz"
    sha256 "dd7b4cb2089818112be2fea63c349c655c3a38218db55a2a3718236fd56c5193"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.7/seli_0.2.7_darwin_arm64.tar.gz"
    sha256 "c8ad36de8d72965d8864cbde742996d61ec8f197dd77f02cd1df5cfb03f1c747"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.7/seli_0.2.7_linux_amd64.tar.gz"
    sha256 "f1fb47ae1a660a8e65970e88970ba3abbb1b36ecab292b28f6881964c846a52b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.7/seli_0.2.7_linux_arm.tar.gz"
    sha256 "7f9d87187478cde85e121c91de7f8ac3b5f511de9e47626fa82b55b6fd5b7743"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.7/seli_0.2.7_linux_arm64.tar.gz"
    sha256 "8bf53905a55397772243c78ccd99ce0d0d10987e26a818ee87d0c02fa82f7a47"
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
