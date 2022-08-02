class Oxigraph < Formula
  desc "SPARQL database HTTP server"
  homepage "https://oxigraph.org/server/"
  url "https://github.com/oxigraph/oxigraph/releases/download/v0.3.5/oxigraph_v0.3.5.tar.gz"
  sha256 "9ed466c34ecce38f5a17981dde986ba728303336c06d43c4d1f7fd7351b99e1a"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/oxigraph/oxigraph.git"
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "server"
  end

  test do
    assert_match "oxigraph_server", shell_output("#{bin}/oxigraph_server --help")
  end
end
