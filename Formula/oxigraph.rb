class Oxigraph < Formula
  desc "SPARQL database HTTP server"
  homepage "https://oxigraph.org/server/"
  url "https://github.com/oxigraph/oxigraph/archive/v0.2.3.tar.gz"
  sha256 "5dc95f232e3bbc27f5fb81675894e3d1f9ffde4314a7501e86b2f3e2643578a0"
  license any_of: ["Apache-2.0", "MIT"]
  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  on_linux do
    depends_on "openssl@1.1"
  end

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "server"
  end

  test do
    assert_match "oxigraph_server", shell_output("#{bin}/oxigraph_server --help")
  end
end
