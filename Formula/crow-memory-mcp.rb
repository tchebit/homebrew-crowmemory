class CrowMemoryMcp < Formula
  desc "Persistent memory MCP server for AI agents (Free edition)"
  homepage "https://crowmemory.ai"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.3.1/crow-memory-mcp-free-darwin-aarch64"
      sha256 "773b3a9f0f32cb0f55c5d9bda0ec5d2455218690ba557369234ab97043d6dfaf"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.3.1/crow-memory-mcp-free-darwin-x86_64"
      sha256 "3982265424008218f5b67dee43d461190d0a39b634e51200f867335f5f4ac5a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.3.1/crow-memory-mcp-free-linux-aarch64"
      sha256 "0726c457669afee6f6b2d761389dfbd6d738e6ee5a21753342eaa8a4fbb83086"
    else
      url "https://github.com/tchebit/crowmemory-releases/releases/download/v0.3.1/crow-memory-mcp-free-linux-x86_64"
      sha256 "d51045abde524ff071bee74c47f84a36d2c8656365382290217f2dcf0505d1e2"
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
