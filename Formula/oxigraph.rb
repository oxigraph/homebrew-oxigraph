class Oxigraph < Formula
  desc "SPARQL database HTTP server"
  homepage "https://oxigraph.org/server/"
  url "https://github.com/oxigraph/oxigraph/releases/download/v0.4.11/oxigraph_v0.4.11.tar.gz"
  sha256 "ca5767e74e92f3df533abbd1eb80ae418b725605cb74edd82875dc277ddb8ffc"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/oxigraph/oxigraph.git"
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "cli"
  end

  test do
    assert_match "oxigraph", shell_output("#{bin}/oxigraph --help")
  end
end
