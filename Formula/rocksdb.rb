class Rocksdb < Formula
  desc "Embeddable, persistent key-value store for fast storage"
  homepage "http://rocksdb.org"
  url "https://github.com/facebook/rocksdb/archive/v5.10.2.tar.gz"
  sha256 "939a50281372f60b0c36054b7ff32b7b5a745ebc76db9b70c4eed56647de178c"

  bottle do
    cellar :any
    sha256 "782038a10804e8665869a420953bc848b87b035dca45e460adb6667d2c1e471d" => :high_sierra
    sha256 "dd15a07d2354dd32f37089a42d46e67ccd09e8f628477a4bb1fe0837a0c47c60" => :sierra
    sha256 "8aaae71113360830b6d60824e9c36317b64b5869f8da6c5d17b05b5653089fe8" => :el_capitan
  end

  needs :cxx11
  depends_on "snappy"
  depends_on "lz4"
  depends_on "gflags"

  def install
    ENV.cxx11
    ENV["PORTABLE"] = "1" if build.bottle?
    ENV["DEBUG_LEVEL"] = "0"
    ENV["USE_RTTI"] = "1"
    ENV["DISABLE_JEMALLOC"] = "1" # prevent opportunistic linkage

    # build regular rocksdb
    system "make", "clean"
    system "make", "static_lib"
    system "make", "shared_lib"
    system "make", "tools"
    system "make", "install", "INSTALL_PATH=#{prefix}"

    bin.install "sst_dump" => "rocksdb_sst_dump"
    bin.install "db_sanity_test" => "rocksdb_sanity_test"
    bin.install "db_stress" => "rocksdb_stress"
    bin.install "write_stress" => "rocksdb_write_stress"
    bin.install "ldb" => "rocksdb_ldb"
    bin.install "db_repl_stress" => "rocksdb_repl_stress"
    bin.install "rocksdb_dump"
    bin.install "rocksdb_undump"

    # build rocksdb_lite
    ENV.append_to_cflags "-DROCKSDB_LITE=1"
    ENV["LIBNAME"] = "librocksdb_lite"
    system "make", "clean"
    system "make", "static_lib"
    system "make", "shared_lib"
    system "make", "install", "INSTALL_PATH=#{prefix}"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <assert.h>
      #include <rocksdb/options.h>
      #include <rocksdb/memtablerep.h>
      using namespace rocksdb;
      int main() {
        Options options;
        return 0;
      }
    EOS

    system ENV.cxx, "test.cpp", "-o", "db_test", "-v",
                                "-std=c++11", "-stdlib=libc++", "-lstdc++",
                                "-lz", "-lbz2",
                                "-L#{lib}", "-lrocksdb_lite",
                                "-L#{Formula["snappy"].opt_lib}", "-lsnappy",
                                "-L#{Formula["lz4"].opt_lib}", "-llz4"
    system "./db_test"

    assert_match "sst_dump --file=", shell_output("#{bin}/rocksdb_sst_dump --help 2>&1", 1)
    assert_match "rocksdb_sanity_test <path>", shell_output("#{bin}/rocksdb_sanity_test --help 2>&1", 1)
    assert_match "rocksdb_stress [OPTIONS]...", shell_output("#{bin}/rocksdb_stress --help 2>&1", 1)
    assert_match "rocksdb_write_stress [OPTIONS]...", shell_output("#{bin}/rocksdb_write_stress --help 2>&1", 1)
    assert_match "ldb - RocksDB Tool", shell_output("#{bin}/rocksdb_ldb --help 2>&1", 1)
    assert_match "rocksdb_repl_stress:", shell_output("#{bin}/rocksdb_repl_stress --help 2>&1", 1)
    assert_match "rocksdb_dump:", shell_output("#{bin}/rocksdb_dump --help 2>&1", 1)
    assert_match "rocksdb_undump:", shell_output("#{bin}/rocksdb_undump --help 2>&1", 1)
  end
end
