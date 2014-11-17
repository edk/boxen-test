require 'formula'

# This duplicates the system "screen", but fixes the ability
# to use vertical splits.

class Screen <Formula
  url 'http://ftp.gnu.org/gnu/screen/screen-4.0.3.tar.gz'
  homepage 'http://www.gnu.org/software/screen'
  sha1 '7bc6e2f0959ffaae6f52d698c26c774e7dec3545'
  version '4.00.03-boxen1'

  def patches
    "http://trac.macports.org/raw-attachment/ticket/20862/screen-4.0.3-snowleopard.patch"
  end unless ARGV.build_head?

  def install
    if ARGV.build_head?
      cd 'src'
      system "autoconf"
      system "autoheader"
    end

    system "./configure", "--prefix=#{prefix}", "--mandir=#{man}", "--infodir=#{info}",
                          "--enable-colors256"
    system "make"
    system "make install"
  end
end
