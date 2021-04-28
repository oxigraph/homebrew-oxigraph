class Oxigraph < Formula
  desc "SPARQL database HTTP server"
  homepage "https://oxigraph.org/server/"
  url "https://github.com/oxigraph/oxigraph/archive/v0.2.4.tar.gz"
  sha256 "b88fee22bd1a79f1e37fec3c0b5c29eae6a5d4dee26742834e55cef8d8e9d866"
  license any_of: ["Apache-2.0", "MIT"]
  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  on_linux do
    depends_on "openssl@1.1"
  end

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "server"
  end

  test do
    assert_match "oxigraph_server", shell_output("#{bin}/oxigraph_server --help")
  end
end
