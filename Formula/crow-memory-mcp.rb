class CrowMemoryMcp < Formula
  desc "Persistent memory MCP server for AI agents (Free edition)"
  homepage "https://crowmemory.ai"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.2.0/crow-memory-mcp-free-darwin-aarch64"
      sha256 "58a7d6b22f3b9af527aa37803d0f08d3e57a9931776912ffa87bdb9047177869"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.2.0/crow-memory-mcp-free-darwin-x86_64"
      sha256 "c35a956a368baea49350d5ae1abc656380bdc404f4bf707e0cc803897605d3ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.2.0/crow-memory-mcp-free-linux-aarch64"
      sha256 "e08ec5f53e60845230075591b5d79c8c2346fe147a178a389bed34887dedb388"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.2.0/crow-memory-mcp-free-linux-x86_64"
      sha256 "bcff72514eb876487bcd3818b1246b9db44df72e8c53d19cf340ce169c0b7012"
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
