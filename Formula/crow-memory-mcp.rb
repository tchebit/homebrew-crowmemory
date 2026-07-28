class CrowMemoryMcp < Formula
  desc "Persistent memory MCP server for AI agents (Free edition)"
  homepage "https://crowmemory.ai"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.3.2/crow-memory-mcp-free-darwin-aarch64"
      sha256 "8d864712275d47a4d3002389839dd47a9a5819a90502c100d5be69272caf9642"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.3.2/crow-memory-mcp-free-darwin-x86_64"
      sha256 "69d2d045854acf8d05ee937964a7070069308390cd265f3ff5ffcb68aaa800f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.3.2/crow-memory-mcp-free-linux-aarch64"
      sha256 "174093df606a7012c5702f1dfb212cb8b73c1300c49efabe33b142ce089c2337"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.3.2/crow-memory-mcp-free-linux-x86_64"
      sha256 "32293942d2e31adc9918ff77db3c3d592ff4e01eaec8641a9db93bd4df8dfff3"
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
