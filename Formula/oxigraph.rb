class Oxigraph < Formula
  desc "SPARQL database HTTP server"
  homepage "https://oxigraph.org/server/"
  url "https://github.com/oxigraph/oxigraph/releases/download/v0.3.1.tar.gz"
  sha256 "68c1fe89b07d4395772cb07b7678424810d3c647addaeb0ac7cca5884b82c7cb"
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
