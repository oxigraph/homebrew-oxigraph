class Oxigraph < Formula
  desc "SPARQL database HTTP server"
  homepage "https://oxigraph.org/server/"
  url "https://github.com/oxigraph/oxigraph/releases/download/v0.4.0-rc.1/oxigraph_v0.4.0-rc.1.tar.gz"
  sha256 "2c25a41f080401278f358226a4f998346ab76b7df3775eb46460384d4083312d"
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
