class Seli < Formula
  desc "A CLI toolkit for managing deployments and release tags"
  homepage "https://github.com/bugloper/homebrew-seli"
  version "0.2.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.1/seli_0.2.1_darwin_amd64.tar.gz"
    sha256 "b456a06f0c74e400011afc973e0483d20a5ce90f4065da30f809e8a622ae2e28"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.1/seli_0.2.1_darwin_arm64.tar.gz"
    sha256 "1030234056b2678b23f40883dad7715a4b31e0667aac6cb84fa81936fa4dd521"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.1/seli_0.2.1_linux_amd64.tar.gz"
    sha256 "dc99be3a1c32e91d1238810ed6666edfb8b7395f0055589dd04c570bc7b60ff4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.1/seli_0.2.1_linux_arm.tar.gz"
    sha256 "f38749bfbc3e7eb31ca71ed19352d3d23fbcaa421bced719f7dd1860fe35759e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/bugloper/homebrew-seli/releases/download/0.2.1/seli_0.2.1_linux_arm64.tar.gz"
    sha256 "86a8bdb30ff86b45e1ce1df3d0c2f2992d4a2df4fa9d75ffe43173b412813a55"
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
