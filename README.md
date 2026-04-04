# Claude Vim IDE

Turn Neovim into a lightweight IDE with Claude Code integration, file explorer, and built-in terminal.

## Installation

### 1. Install Claude Code Neovim Plugin

```bash
claude install-vim-extension
```

### 2. Copy Config Files

Copy the config files to your Neovim config directory:

```bash
git clone https://github.com/yushengsu-thu/claude-vim-IDE.git
cp claude-vim-IDE/init.lua ~/.config/nvim/init.lua
cp -r claude-vim-IDE/lua ~/.config/nvim/
```

### 3. Launch Neovim

```bash
nvim
```

Plugins will be auto-installed on first launch via lazy.nvim.

## Features

- **Built-in terminal** at the bottom (auto-opens on startup)
- **File explorer** on the left side
- **Claude Code** integration (AI assistant panel)
- **Mouse support** (drag to resize splits)
- **Minimal statusline** (file path + line/column only)

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+`` | Toggle bottom terminal |
| `Ctrl+N` | Toggle file explorer (left sidebar) |
| `:CC` | Open/close Claude Code panel |

## File Explorer (nvim-tree)

| Key | Action |
|-----|--------|
| `Enter` | Open file |
| `a` | Create new file/folder (add `/` for folder) |
| `d` | Delete |
| `r` | Rename |
| `c` | Copy |
| `p` | Paste |

## Plugins

- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) — bottom terminal
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) — file explorer
- [claude-code.nvim](https://github.com/greggh/claude-code.nvim) — Claude Code integration
- [lazy.nvim](https://github.com/folke/lazy.nvim) — plugin manager
