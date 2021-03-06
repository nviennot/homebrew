class Tmate < Formula
  desc "Instant terminal sharing"
  homepage "http://tmate.io"
  url "https://github.com/tmate-io/tmate/archive/2.2.1.tar.gz"
  sha256 "d9c2ac59f42e65aac5f500f0548ea8056fd79c9c5285e5af324d833e2a84c305"

  head "https://github.com/tmate-io/tmate.git"

  bottle do
    cellar :any
    sha256 "772982dbe9cabdf4f57d3fd1f968970ee770df538930e3540cdbc349d6e7e5d6" => :el_capitan
    sha256 "c558b7b57802d23d9365e895ee4e5fba2e2325f2b39caddcb84497030291c4f2" => :yosemite
    sha256 "8be4af6f9b0aabeb8aa8b85e61cc708aa60fca19f581fff4c150060880980efc" => :mavericks
  end

  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "libevent"
  depends_on "libssh"
  depends_on "msgpack"

  def install
    system "sh", "autogen.sh"

    ENV.append "LDFLAGS", "-lresolv"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--sysconfdir=#{etc}"
    system "make", "install"
  end

  test do
    system "#{bin}/tmate", "-V"
  end
end
