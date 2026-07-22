class CrowMemoryMcp < Formula
  desc "Persistent memory MCP server for AI agents (Free edition)"
  homepage "https://crowmemory.ai"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.2.2/crow-memory-mcp-free-darwin-aarch64"
      sha256 "c478f6ed79e69575ac373c511f22712a75de402b0f5bb422a7565570cfb034cc"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.2.2/crow-memory-mcp-free-darwin-x86_64"
      sha256 "556fda38ff1546a78e0c99f4271a38a85a4f4a956204e109dab88088a460bda2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.2.2/crow-memory-mcp-free-linux-aarch64"
      sha256 "ca059689ec1862f600744b65b701d94cfa0e521c61b6bf59aadae0c193ca4ce4"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.2.2/crow-memory-mcp-free-linux-x86_64"
      sha256 "9ce27e3596082d96353c57b572612c1fa0df875e17b0fabd5031a7dd948130ed"
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
