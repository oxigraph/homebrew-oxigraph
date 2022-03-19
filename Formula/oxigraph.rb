class Oxigraph < Formula
  desc "SPARQL database HTTP server"
  homepage "https://oxigraph.org/server/"
  url "https://github.com/oxigraph/oxigraph/releases/download/v0.3.0/oxigraph_v0.3.0.tar.gz"
  sha256 "eb0684a06c08b47f31d1539093f5b6acbf8ababf89153a5a9f4bca1fbeb395e0"
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
