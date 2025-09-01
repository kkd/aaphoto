class Aaphoto < Formula
  desc "Auto Adjust Photo - command-line image manipulation tool for automatic color correction"
  homepage "http://log69.com/aaphoto_en.html"
  url "https://github.com/your-username/aaphoto/archive/v0.45.tar.gz"
  sha256 "YOUR_SHA256_HERE"
  license "GPL-3.0-or-later"
  version "0.45"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "libjpeg"
  depends_on "libpng"
  depends_on "zlib"
  depends_on "gcc" => :build

  def install
    system "./autogen.sh" if File.exist?("autogen.sh")
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/aaphoto", "--version"
  end
end
