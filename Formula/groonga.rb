class Groonga < Formula
  desc "Fulltext search engine and column store"
  homepage "http://groonga.org/"
  url "https://packages.groonga.org/source/groonga/groonga-7.1.1.tar.gz"
  sha256 "57b66f724c80a50531f479126cc254e2f5c7a341e381faf32b4afde3c938ead3"

  bottle do
    sha256 "079052752cd476d56595ba25f96340f4b366b9066d2839fc614af361812e70c2" => :high_sierra
    sha256 "cd714f5fe8596122c9e9894dd664207afd51807a2c51a94e7f298f991503d0e5" => :sierra
    sha256 "56a3e60191a237511d76e36e49a2f2929c27fadf66e13dae9cac485cfeced357" => :el_capitan
  end

  head do
    url "https://github.com/groonga/groonga.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  option "with-glib", "With benchmark program for developer use"
  option "with-zeromq", "With suggest plugin for suggesting"
  option "with-stemmer", "Build with libstemmer support"

  deprecated_option "enable-benchmark" => "with-glib"
  deprecated_option "with-benchmark" => "with-glib"
  deprecated_option "with-suggest-plugin" => "with-zeromq"

  depends_on "pkg-config" => :build
  depends_on "pcre"
  depends_on "msgpack"
  depends_on "openssl"
  depends_on "glib" => :optional
  depends_on "lz4" => :optional
  depends_on "mecab" => :optional
  depends_on "mecab-ipadic" if build.with? "mecab"
  depends_on "zeromq" => :optional
  depends_on "libevent" if build.with? "zeromq"
  depends_on "zstd" => :optional

  resource "groonga-normalizer-mysql" do
    url "https://packages.groonga.org/source/groonga-normalizer-mysql/groonga-normalizer-mysql-1.1.1.tar.gz"
    sha256 "bc83d1e5e0f32d4b95e219cb940a7e3f61f0f743abd3bd47c2d436a34e503870"
  end

  resource "stemmer" do
    url "https://github.com/snowballstem/snowball.git",
        :revision => "5137019d68befd633ce8b1cd48065f41e77ed43e"
  end

  link_overwrite "lib/groonga/plugins/normalizers/"
  link_overwrite "share/doc/groonga-normalizer-mysql/"
  link_overwrite "lib/pkgconfig/groonga-normalizer-mysql.pc"

  def install
    args = %W[
      --prefix=#{prefix}
      --with-zlib
      --with-ssl
      --enable-mruby
    ]

    if build.with? "zeromq"
      args << "--enable-zeromq"
    else
      args << "--disable-zeromq"
    end

    if build.with? "stemmer"
      resource("stemmer").stage do
        system "make", "dist_libstemmer_c"
        system "tar", "xzf", "dist/libstemmer_c.tgz", "-C", buildpath
        Dir.chdir buildpath.join("libstemmer_c")
        system "make"
        mkdir "lib"
        mv "libstemmer.o", "lib/libstemmer.a"
        args << "--with-libstemmer=#{Dir.pwd}"
      end
    else
      args << "--without-libstemmer"
    end

    args << "--enable-benchmark" if build.with? "glib"
    args << "--with-mecab" if build.with? "mecab"
    args << "--with-lz4" if build.with? "lz4"
    args << "--with-zstd" if build.with? "zstd"

    if build.head?
      args << "--with-ruby"
      system "./autogen.sh"
    end

    system "./configure", *args
    system "make", "install"

    resource("groonga-normalizer-mysql").stage do
      ENV.prepend_path "PATH", bin
      ENV.prepend_path "PKG_CONFIG_PATH", lib/"pkgconfig"
      system "./configure", "--prefix=#{prefix}"
      system "make"
      system "make", "install"
    end
  end

  test do
    IO.popen("#{bin}/groonga -n #{testpath}/test.db", "r+") do |io|
      io.puts("table_create --name TestTable --flags TABLE_HASH_KEY --key_type ShortText")
      sleep 2
      io.puts("shutdown")
      # expected returned result is like this:
      # [[0,1447502555.38667,0.000824928283691406],true]\n
      assert_match(/\[\[0,\d+.\d+,\d+.\d+\],true\]/, io.read)
    end

    IO.popen("#{bin}/groonga -n #{testpath}/test-normalizer-mysql.db", "r+") do |io|
      io.puts "register normalizers/mysql"
      sleep 2
      io.puts("shutdown")
      # expected returned result is like this:
      # [[0,1447502555.38667,0.000824928283691406],true]\n
      assert_match(/\[\[0,\d+.\d+,\d+.\d+\],true\]/, io.read)
    end
  end
end
