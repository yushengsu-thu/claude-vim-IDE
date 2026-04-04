# Claude Code in Neovim

## 1. Launch Neovim

Open a terminal and run:

```bash
nvim
```

To open a specific file:

```bash
nvim filename.py
```

## 2. Use Claude Code

Inside Neovim, enter command mode by pressing `:`, then type the full command:

```
:ClaudeCode
```

This will open the Claude Code panel within Neovim.

> **Note:** Do not use the short form `:claude` — it will cause `E464: Ambiguous use of user-defined command` because multiple commands share the `claude` prefix. Always use the full command `:ClaudeCode`.
