class CrowMemoryMcp < Formula
  desc "Persistent memory MCP server for AI agents (Free edition)"
  homepage "https://crowmemory.ai"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.2.1/crow-memory-mcp-free-darwin-aarch64"
      sha256 "5f2b7b3acf1374a69745354d9f76dfbc484d0ab9b53f180ead228a3522556cb4"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.2.1/crow-memory-mcp-free-darwin-x86_64"
      sha256 "f511ad4629a1c7a197204fe8517a97b62805593a9f2f298780895a13e3790309"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.2.1/crow-memory-mcp-free-linux-aarch64"
      sha256 "3d76e4563066466298f30a8b1736d097ad6f11507523946dd2a266151ca71d3f"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.2.1/crow-memory-mcp-free-linux-x86_64"
      sha256 "9b8cb60669a2756d43ce3f95498237767777f012e013fd305051020849ea4871"
    end
  end

  def install
    local_binary = Dir["crow-memory-mcp-free-*"].reject { |f| f.end_with?(".txt") }.first
    bin.install local_binary => "crow-memory-mcp"
    chmod 0755, bin/"crow-memory-mcp"
  end

  test do
    system "#{bin}/crow-memory-mcp", "--help"
  end
end
