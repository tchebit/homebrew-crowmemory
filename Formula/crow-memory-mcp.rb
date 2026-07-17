class CrowMemoryMcp < Formula
  desc "Persistent memory MCP server for AI agents (Free edition)"
  homepage "https://crowmemory.ai"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.1.4/crow-memory-mcp-free-darwin-aarch64"
      sha256 "920db32a29251792a8f67839523f59c939ca1032333919972ac1bfe01c93684f"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.1.4/crow-memory-mcp-free-darwin-x86_64"
      sha256 "18e7413a5520b1fbe730e3a388fdf4d8b0cda3190379188111f1432b192868dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.1.4/crow-memory-mcp-free-linux-aarch64"
      sha256 "8f0e9a4f98306baa1d998fa633423b045aac49d212ad30730961018aebdeba91"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.1.4/crow-memory-mcp-free-linux-x86_64"
      sha256 "7e9c624a01ddc24758cb850b25d771f5d78147e530bfca6cfe44bd791c2a1230"
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
