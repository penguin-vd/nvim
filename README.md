# Neovim Config

Personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Structure

```
init.lua              # Entry point
lua/config/           # Core configuration
  options.lua         # Editor options
  keymaps.lua         # Key mappings
  autocmds.lua        # Autocommands
  lazy.lua            # Plugin manager setup
lua/plugins/          # Plugin specs
```

## Plugins

- **colorscheme** - Rose Pine (Moon)
- **telescope** - Fuzzy finder
- **treesitter** - Syntax highlighting
- **lsp** - Language server support
- **harpoon** - Quick file navigation
- **oil** - File explorer
- **mini** - Mini.nvim modules
- **git** - Git integration
- **formatting** - Code formatting
- **comments** - Code comments
- **markdown** - Markdown support
- **flutter** - Flutter development
- **lilypond** - LilyPond music notation
- **wakatime** - Coding activity tracking
- **brainrot** - Brainrot

## Requirements

- Neovim >= 0.9
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional, for icons)
