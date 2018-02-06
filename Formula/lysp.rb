class Lysp < Formula
  desc "Small Lisp interpreter"
  homepage "http://www.piumarta.com/software/lysp/"
  url "http://www.piumarta.com/software/lysp/lysp-1.1.tar.gz"
  sha256 "436a8401f8a5cc4f32108838ac89c0d132ec727239d6023b9b67468485509641"
  revision 4

  bottle do
    cellar :any
    sha256 "c5bac7fdb03d9f6cf682e3accb11a6f3d66f73646290f748f70a092dc8a22aaf" => :high_sierra
    sha256 "5c9f575cdef03223be2d182bd687ba327c512c46ebaabd3195016ef1937e2f0b" => :sierra
    sha256 "b5e4678d23246d60439074f6bf41c57a2f8c2a43718eff304c710073a176971a" => :el_capitan
  end

  depends_on "bdw-gc"
  depends_on "gcc"

  fails_with :clang do
    cause "use of unknown builtin '__builtin_return'"
  end

  # Use our CFLAGS
  patch :DATA

  def install
    # this option is supported only for ELF object files
    inreplace "Makefile", "-rdynamic", ""

    system "make", "CC=#{ENV.cc}"
    bin.install "lysp", "gclysp"
  end

  test do
    (testpath/"test.l").write <<~EOS
      (define println (subr (dlsym "printlnSubr")))
      (define + (subr (dlsym "addSubr")))
      (println (+ 40 2))
    EOS

    assert_equal "42", shell_output("#{bin}/lysp test.l").chomp
  end
end

__END__
diff --git a/Makefile b/Makefile
index fc3f5d9..0b0e20d 100644
--- a/Makefile
+++ b/Makefile
@@ -1,6 +1,3 @@
-CFLAGS  = -O  -g -Wall
-CFLAGSO = -O3 -g -Wall -DNDEBUG
-CFLAGSs = -Os -g -Wall -DNDEBUG
 LDLIBS  = -rdynamic
 
 all : lysp gclysp
@@ -10,15 +7,15 @@ lysp : lysp.c gc.c
 	size $@
 
 olysp: lysp.c gc.c
-	$(CC) $(CFLAGSO) -DBDWGC=0 -o $@ lysp.c gc.c $(LDLIBS) -ldl
+	$(CC) $(CFLAGS) -DBDWGC=0 -o $@ lysp.c gc.c $(LDLIBS) -ldl
 	size $@
 
 ulysp: lysp.c gc.c
-	$(CC) $(CFLAGSs) -DBDWGC=0 -o $@ lysp.c gc.c $(LDLIBS) -ldl
+	$(CC) $(CFLAGS) -DBDWGC=0 -o $@ lysp.c gc.c $(LDLIBS) -ldl
 	size $@
 
 gclysp: lysp.c
-	$(CC) $(CFLAGSO) -DBDWGC=1  -o $@ lysp.c $(LDLIBS) -lgc
+	$(CC) $(CFLAGS) -DBDWGC=1  -o $@ lysp.c $(LDLIBS) -lgc
 	size $@
 
 run : all
