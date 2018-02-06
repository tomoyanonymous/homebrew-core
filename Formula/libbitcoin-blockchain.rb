class LibbitcoinBlockchain < Formula
  desc "Bitcoin Blockchain Library"
  homepage "https://github.com/libbitcoin/libbitcoin-blockchain"
  url "https://github.com/libbitcoin/libbitcoin-blockchain/archive/v3.5.0.tar.gz"
  sha256 "03b8362c9172edbeb1e5970c996405cd2738e8274ba459e9b85359d6b838de20"

  bottle do
    sha256 "ecb6471ff0a4859d1bbdee28848c6cc836fee5074b2b3b2e7b755e985234d025" => :high_sierra
    sha256 "d0c831fe2ce99b8413eddf941d5df1cf9efbc02e0db3bf937d1cc42c0cade3f1" => :sierra
    sha256 "d9f611bfc4bd40b5c044d066572b912adee81a3a63c8ebb9243522a20204c5c0" => :el_capitan
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "libbitcoin"
  depends_on "libbitcoin-database"

  resource "libbitcoin-consensus" do
    url "https://github.com/libbitcoin/libbitcoin-consensus/archive/v3.5.0.tar.gz"
    sha256 "bb29761d4275a9c993151707557008b23572a3d9adecc0e36a3075cfb101dd1e"
  end

  def install
    ENV.prepend_path "PKG_CONFIG_PATH", Formula["libbitcoin"].opt_libexec/"lib/pkgconfig"
    ENV.prepend_create_path "PKG_CONFIG_PATH", libexec/"lib/pkgconfig"

    resource("libbitcoin-consensus").stage do
      system "./autogen.sh"
      system "./configure", "--disable-dependency-tracking",
                            "--disable-silent-rules",
                            "--prefix=#{libexec}"
      system "make", "install"
    end

    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <bitcoin/blockchain.hpp>
      int main() {
        static const auto default_block_hash = libbitcoin::hash_literal("14508459b221041eab257d2baaa7459775ba748246c8403609eb708f0e57e74b");
        const auto block = std::make_shared<const libbitcoin::message::block>();
        libbitcoin::blockchain::block_entry instance(block);
        assert(instance.block() == block);
        assert(instance.hash() == default_block_hash);
        return 0;
      }
    EOS
    system ENV.cxx, "-std=c++11", "test.cpp",
                    "-I#{libexec}/include",
                    "-L#{lib}", "-L#{libexec}/lib",
                    "-lbitcoin", "-lbitcoin-blockchain", "-lboost_system",
                    "-o", "test"
    system "./test"
  end
end
