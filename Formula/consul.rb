require "language/go"

class Consul < Formula
  desc "Tool for service discovery, monitoring and configuration"
  homepage "https://www.consul.io"
  url "https://github.com/hashicorp/consul.git",
      :tag => "v1.0.3",
      :revision => "48f3dd5642374d079f5a64359023fb8318eb81cc"

  head "https://github.com/hashicorp/consul.git",
       :shallow => false

  bottle do
    cellar :any_skip_relocation
    sha256 "03dbaf930ce4253b3b4e4a83a92635f170b54ef1a69c981ff195a12c2a2118b0" => :high_sierra
    sha256 "ec82a15dd396db7b7e88aee7c4ed7aeaf68d66a4d5c12c897abb11b4d876090b" => :sierra
    sha256 "f6503849d3241f10d467064236269f715ebf054fc16e7042831fdadde1d12b37" => :el_capitan
  end

  depends_on "go" => :build
  depends_on "gox" => :build

  go_resource "github.com/axw/gocov" do
    url "https://github.com/axw/gocov.git",
        :revision => "3a69a0d2a4ef1f263e2d92b041a69593d6964fe8"
  end

  go_resource "github.com/elazarl/go-bindata-assetfs" do
    url "https://github.com/elazarl/go-bindata-assetfs.git",
        :revision => "30f82fa23fd844bd5bb1e5f216db87fd77b5eb43"
  end

  go_resource "github.com/jteeuwen/go-bindata" do
    url "https://github.com/jteeuwen/go-bindata.git",
        :revision => "a0ff2567cfb70903282db057e799fd826784d41d"
  end

  go_resource "github.com/magiconair/vendorfmt" do
    url "https://github.com/magiconair/vendorfmt.git",
        :revision => "0fde667441ebc14dbd64a1de758ab656b78c607b"
  end

  go_resource "github.com/matm/gocov-html" do
    url "https://github.com/matm/gocov-html.git",
        :revision => "f6dd0fd0ebc7c8cff8b24c0a585caeef250627a3"
  end

  go_resource "golang.org/x/tools" do
    url "https://go.googlesource.com/tools.git",
        :branch => "release-branch.go1.9"
  end

  def install
    # Avoid running `go get`
    inreplace "GNUmakefile", "go get -u -v $(GOTOOLS)", ""

    ENV["GOPATH"] = buildpath
    contents = Dir["{*,.git,.gitignore}"]
    (buildpath/"src/github.com/hashicorp/consul").install contents

    ENV.prepend_create_path "PATH", buildpath/"bin"
    Language::Go.stage_deps resources, buildpath/"src"

    build_tools = [
      "github.com/axw/gocov/gocov",
      "github.com/elazarl/go-bindata-assetfs/go-bindata-assetfs",
      "github.com/jteeuwen/go-bindata/go-bindata",
      "github.com/magiconair/vendorfmt/cmd/vendorfmt",
      "github.com/matm/gocov-html",
      "golang.org/x/tools/cmd/cover",
      "golang.org/x/tools/cmd/stringer",
    ]

    build_tools.each do |tool|
      cd "src/#{tool}" do
        system "go", "install"
      end
    end

    cd "src/github.com/hashicorp/consul" do
      system "make"
      bin.install "bin/consul"
      prefix.install_metafiles
    end
  end

  plist_options :manual => "consul agent -dev -advertise 127.0.0.1"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>KeepAlive</key>
        <dict>
          <key>SuccessfulExit</key>
          <false/>
        </dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/consul</string>
          <string>agent</string>
          <string>-dev</string>
          <string>-advertise</string>
          <string>127.0.0.1</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>WorkingDirectory</key>
        <string>#{var}</string>
        <key>StandardErrorPath</key>
        <string>#{var}/log/consul.log</string>
        <key>StandardOutPath</key>
        <string>#{var}/log/consul.log</string>
      </dict>
    </plist>
    EOS
  end

  test do
    fork do
      exec "#{bin}/consul", "agent", "-data-dir", "."
    end
    sleep 3
    system "#{bin}/consul", "leave"
  end
end
