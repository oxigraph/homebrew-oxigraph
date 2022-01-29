class Oxigraph < Formula
  desc "SPARQL database HTTP server"
  homepage "https://oxigraph.org/server/"
  url "https://github.com/oxigraph/oxigraph/archive/v0.3.0-beta.2.tar.gz"
  sha256 "8ff817fed08f43fd6a3f831ed9dcbf8173c6e66e89702fbe2ab5b286d9cea986"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/oxigraph/oxigraph.git"
  depends_on "rust" => :build

  def install
    system "sed", "-i", "s/path = .*, //g", "server/Cargo.toml"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "server"
  end

  test do
    assert_match "oxigraph_server", shell_output("#{bin}/oxigraph_server --help")
  end
end
