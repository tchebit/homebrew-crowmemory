class CrowMemoryMcp < Formula
  desc "Persistent memory MCP server for AI agents (Free edition)"
  homepage "https://crowmemory.ai"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.3.0/crow-memory-mcp-free-darwin-aarch64"
      sha256 "662de42064243d8ee93f0be9a75329b557db9a9ebc66253133a68af35d3bc133"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.3.0/crow-memory-mcp-free-darwin-x86_64"
      sha256 "688a411649e160a5e91a73efaf9dad9bc2bb8c94c0a76b3d1ad1d91ef8686204"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.3.0/crow-memory-mcp-free-linux-aarch64"
      sha256 "f5048c91de2433f907d88c37dd7df801be4e87f90184d7107ba97191dc13924d"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.3.0/crow-memory-mcp-free-linux-x86_64"
      sha256 "863925ee1993e6bd7fdf8d95f663cec5850ceee9bc43374530f8557bbd0c5632"
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
