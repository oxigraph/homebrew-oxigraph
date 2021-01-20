class Oxigraph < Formula
  desc "A simple SPARQL database HTTP server"
  homepage "https://oxigraph.org/server/"
  license any_of: ["Apache-2.0", "MIT"]
  version "0.2.1"
  url "https://github.com/oxigraph/oxigraph/archive/v0.2.1.tar.gz"
  sha256 "2db897211ef7821f0988cf9140c843d4703aa92fbf8fcd9552ccc11843ae3ade"
  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--bin", "oxigraph_server"
    bin.install "target/release/oxigraph_server"
  end
end

test do
  assert_match "oxigraph_server", shell_output("#{bin}/oxigraph_server --help")
end
