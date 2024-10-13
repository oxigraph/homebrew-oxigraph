class Oxigraph < Formula
  desc "SPARQL database HTTP server"
  homepage "https://oxigraph.org/server/"
  url "https://github.com/oxigraph/oxigraph/releases/download/v0.4.1/oxigraph_v0.4.1.tar.gz"
  sha256 "c7fe9f5946397eaf7c74408681a595ab8fbb49cd472ac7becc3082a1a74d5ba1"
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
