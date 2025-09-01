class Aaphoto < Formula
  desc "Auto Adjust Photo - command-line image manipulation tool for automatic color correction"
  homepage "http://log69.com/aaphoto_en.html"
  url "https://github.com/kkd/aaphoto/archive/v0.45.1.tar.gz"
  sha256 "fe6eb88674900c0623e649d7d3e40f88810b09299427f26007f7b9be8e1d0c30"
  license "GPL-3.0-or-later"
  version "0.45.1"

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
