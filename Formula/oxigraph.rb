class Oxigraph < Formula
  desc "SPARQL database HTTP server"
  homepage "https://oxigraph.org/server/"
  url "https://github.com/oxigraph/oxigraph/releases/download/v0.4.9/oxigraph_v0.4.9.tar.gz"
  sha256 "eef5e2ce5606f4433f2af876cf8c119ca31b8b1cb6cf32ee7d319d9680e1e7ea"
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
