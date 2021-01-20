class Oxigraph < Formula
  desc "SPARQL database HTTP server"
  homepage "https://oxigraph.org/server/"
  url "https://github.com/oxigraph/oxigraph/archive/v0.2.1.tar.gz"
  sha256 "2db897211ef7821f0988cf9140c843d4703aa92fbf8fcd9552ccc11843ae3ade"
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
