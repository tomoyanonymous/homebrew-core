class Qtkeychain < Formula
  desc "Platform-independent Qt API for storing passwords securely"
  homepage "https://github.com/frankosterfeld/qtkeychain"
  url "https://github.com/frankosterfeld/qtkeychain/archive/v0.8.0.tar.gz"
  sha256 "b492f603197538bc04b2714105b1ab2b327a9a98d400d53d9a7cb70edd2db12f"

  bottle do
    cellar :any
    sha256 "7bb2cc22642e794684140108c996c3373c4ce248f230622a4039fe59f7b178fe" => :high_sierra
    sha256 "3ff9191c8be9555c43ca5b4ba2c2aae4c93bf640c3d03a7e42bac76920f46c80" => :sierra
    sha256 "3197c42afc2c347dfd25db4bf4b45ceba70d2b866e4ee3f23f57b3501323a3c9" => :el_capitan
  end

  depends_on "cmake" => :build
  depends_on "qt"

  def install
    system "cmake", ".", "-DBUILD_TRANSLATIONS=OFF", *std_cmake_args
    system "make", "install"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <qt5keychain/keychain.h>
      int main() {
        QKeychain::ReadPasswordJob job(QLatin1String(""));
        return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-o", "test", "-std=c++11", "-I#{include}",
                    "-L#{lib}", "-lqt5keychain",
                    "-I#{Formula["qt"].opt_include}",
                    "-F#{Formula["qt"].opt_lib}", "-framework", "QtCore"
    system "./test"
  end
end
