class Oxigraph < Formula
  desc "SPARQL database HTTP server"
  homepage "https://oxigraph.org/server/"
  url "https://github.com/oxigraph/oxigraph/releases/download/v0.4.2/oxigraph_v0.4.2.tar.gz"
  sha256 "9e1873f31f2f4f73f6122a7c242c8639e5393a4dc2efb7e90ee8745f2e115c50"
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
