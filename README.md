# homebrew-crowmemory

Homebrew tap for [CrowMemory MCP](https://crowmemory.ai) (Free edition).

## Install

```bash
brew tap tchebit/crowmemory
brew install crow-memory-mcp
```

## Add to Claude

```bash
claude mcp add -s user crow-memory -- crow-memory-mcp
```

See [tchebit/crowmemory-releases](https://github.com/tchebit/crowmemory-releases) for full docs, Pro/Teams editions, and other MCP clients (Claude Desktop, Zed, Cursor, Windsurf).

## Updating the formula

`Formula/crow-memory-mcp.rb` is updated automatically by the release pipeline in the private monorepo on every `v*` tag. Manual edits will be overwritten on the next release.
