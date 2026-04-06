class Seli < Formula
  desc "A CLI toolkit for managing deployments and release tags"
  homepage "https://github.com/bugloper/homebrew-seli"
  version "0.2.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.3/seli_0.2.3_darwin_amd64.tar.gz"
    sha256 "6d48e9cc50890841b9fd453a978faf621eb21fe4effe0e55038f7ade48e635d8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.3/seli_0.2.3_darwin_arm64.tar.gz"
    sha256 "72b71442e52364217c177a9ffd2eaead74e1b716ab8e97ec60c812ce0de3bd8a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.3/seli_0.2.3_linux_amd64.tar.gz"
    sha256 "5fd627e1dacc014124c3e55f1cfcd740b1b53593c270823539828164098de866"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.3/seli_0.2.3_linux_arm.tar.gz"
    sha256 "0df4c05a3f230e942155ac5058a799f224ead26a4bc53160157d4d4c818b8c4d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.3/seli_0.2.3_linux_arm64.tar.gz"
    sha256 "c840e8af67c217ef840644fd460e03388606991a403006cc33ae977bcca17546"
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
