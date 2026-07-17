class CrowMemoryMcp < Formula
  desc "Persistent memory MCP server for AI agents (Free edition)"
  homepage "https://crowmemory.ai"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v#{version}/crow-memory-mcp-free-darwin-aarch64"
      sha256 "64843dba12e60d6e6731023868f2eb8aa0607b0c245b495a4d2ba536a565548b"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v#{version}/crow-memory-mcp-free-darwin-x86_64"
      sha256 "fb35546fdf4781649503c136d9c022388612ea3ffe57dc54c82e3e7687995635"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v#{version}/crow-memory-mcp-free-linux-aarch64"
      sha256 "04d6d43c29b05e74aba20ab481359a0feb52c1698c90120c7cdb9594170b698c"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v#{version}/crow-memory-mcp-free-linux-x86_64"
      sha256 "1aaa7240cd0ad4b52e60814688df58e1715a3dfb7f8e4858171e1dfe34b2992d"
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
