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
- **finder** - Fuzzy finder (fff.nvim + Snacks picker)
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

## Keybindings

See [KEYBINDINGS.md](KEYBINDINGS.md) for a full cheat sheet.

## Dependencies

External tools required or used by plugins:

| Dependency | Required By | Purpose |
|---|---|---|
| [Node.js](https://nodejs.org/) + Yarn | markdown-preview | Markdown live preview (build step) |
| [stylua](https://github.com/JohnnyMorganz/StyLua) | conform, mason | Lua formatting |
| [black](https://github.com/psf/black) | conform | Python formatting |
| [clangd](https://clangd.llvm.org/) | lspconfig | C/C++ language server |
| [Flutter SDK](https://flutter.dev/) | flutter-tools | Flutter development |
| [LilyPond](https://lilypond.org/) | nvim-lilypond-suite | Music notation |
| `make` / C compiler | LuaSnip | jsregexp (build step) |
| [Rustup](https://rustup.rs/) | fff.nvim | Fuzzy finder (build step) |
| [WakaTime CLI](https://wakatime.com/) | vim-wakatime | Coding activity tracking (requires API key) |

> `mason.nvim` can auto-install `stylua` and `clangd` for you.

## Requirements

- Neovim >= 0.9
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional, for icons)

## Install

Back up your existing config (if any), then clone:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/penguin-vd/nvim.git ~/.config/nvim
```

Open Neovim and plugins will install automatically on first launch:

```bash
nvim
```
