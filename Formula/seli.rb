class Seli < Formula
  desc "A CLI application"
  homepage "https://github.com/ELISEdigitalplatforms/l0-go-bt-seli"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/ELISEdigitalplatforms/l0-go-bt-seli/releases/download/0.1.0/seli_0.1.0_darwin_amd64.tar.gz"
    sha256 "4841d0d233db2d126de22f70b7eba234ce0a6899ee844039ef5459bf2cd62b4d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ELISEdigitalplatforms/l0-go-bt-seli/releases/download/0.1.0/seli_0.1.0_darwin_arm64.tar.gz"
    sha256 "c4192b2cb05f805be7e75c37d7b87864ab94d8cd0a427e55d18bd75d158c4356"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/ELISEdigitalplatforms/l0-go-bt-seli/releases/download/0.1.0/seli_0.1.0_linux_amd64.tar.gz"
    sha256 "47f7d78f2d7cc2ef3da6a62a1c0fee0ea1435e12b715b7e67fe6a5ed762a7f29"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/ELISEdigitalplatforms/l0-go-bt-seli/releases/download/0.1.0/seli_0.1.0_linux_arm.tar.gz"
    sha256 "4ff513c233259a31486d6026b2d6ee8fd23dc5d085e902dbea07702c43928746"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/ELISEdigitalplatforms/l0-go-bt-seli/releases/download/0.1.0/seli_0.1.0_linux_arm64.tar.gz"
    sha256 "9419da7c8b30b553f1b13d27d87eede659e4352b147cec2bec30e6f4538de11a"
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
