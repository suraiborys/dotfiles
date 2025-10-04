# DOTFILES

Personal dotfiles setup using Ansible. Works on my machine)))

**Note**: This is my personal setup. If you want to use these configs, check the files in `/files` directory directly rather than running the playbook on your system.

**Disclaimer**: No warranty that applying the playbook or configs won't break your system. Made public for convenience, not because it's production-ready. Use at your own risk and don't blame me if something explodes.

## Prerequisites
- Ansible installed (e.g., via pip or your package manager)
- macOS shell environment (primary target)
- Nerd Font installed for proper terminal rendering
- Node.js (for TypeScript LSP servers)
- Python 3.x with uv (Astral's package manager)
- Ripgrep (for Telescope live grep)
- fd (for Telescope file finding)
- lazygit (for git TUI integration)

**Optional Dependencies (auto-detected):**
- `fzf` - Fuzzy finder for enhanced shell experience
- `starship` - Cross-shell prompt
- `git` - Required for fzf-git integration

**Platform Notes:**
- **macOS**: This is what I use, so it works here
- **Ubuntu/Linux**: Might work with some tweaking, but I haven't tested it

## Available Configurations

### Core Applications
- [x] **ghostty** - Terminal emulator config
- [x] **zed** - Editor settings
- [x] **nvim** - Complete Neovim setup with plugins
- [x] **tmux** - Terminal multiplexer with TPM
- [x] **zsh** - Shell configuration with plugins
- [x] **starship** - Cross-shell prompt

### Neovim Features
- **Plugin Manager**: lazy.nvim with auto-installation
- **Colorscheme**: Tokyo Night theme with custom colors
- **File Explorer**: nvim-tree with git integration
- **Fuzzy Finder**: Telescope with fzf-native for fast search
- **LSP Support**:
  - Python: Pyright (type checking) + Ruff (linting/formatting)
  - TypeScript/JavaScript: ts_ls + ESLint
  - Web: HTML, CSS, TailwindCSS
  - Lua: lua_ls
- **Formatting**: conform.nvim with format-on-save (Ruff, Prettier, Stylua)
- **Linting**: nvim-lint with auto-triggers (Ruff, ESLint)
- **Completion**: nvim-cmp with LSP, snippets, buffer, and path sources
- **Git Integration**: gitsigns (inline changes) + lazygit (full TUI)
- **UI Enhancements**: lualine, bufferline, which-key, alpha, dressing
- **Syntax**: Treesitter highlighting, auto-pairs, indent guides
- **Documentation**: See `files/nvim/nvim.md` for all keybindings

### Shell Enhancements
- **FZF Integration**: Fuzzy finding with fd backend
- **Git Integration**: fzf-git.sh for enhanced git workflows
- **Plugin Support**: zsh-autosuggestions, zsh-syntax-highlighting
- **Local Config**: Support for `~/.zshrc.local` for personal settings

## Quick Start
```bash
ansible-playbook -i inventory/hosts playbook.yml
```

## Key Features & Usage

### Neovim Keybindings
**See `files/nvim/nvim.md` for complete reference**

Quick highlights:
- **Leader key**: `Space`
- **File Explorer**: `<leader>ee` - Toggle, `<leader>ef` - Focus current file
- **Fuzzy Find**: `<leader>ff` - Files, `<leader>fs` - Live grep, `<leader>fr` - Recent files
- **LSP**: `gd` - Definition, `gr` - References, `K` - Hover, `<leader>ca` - Code actions
- **Git**: `<leader>lg` - LazyGit, `]h`/`[h]` - Next/prev hunk, `<leader>hs` - Stage hunk
- **Format**: `<leader>mp` - Format file (auto-format on save enabled)
- **Which-key**: Press `<leader>` and wait to see available keybindings

### FZF Keybindings
- **File Search**: `<C-t>` - Find files
- **Directory Navigation**: `<C-r>` - Command history, `<M-c>` - Change directory
- **Git Integration**:
  - `<C-g><C-f>` - Git files
  - `<C-g><C-b>` - Git branches
  - `<C-g><C-h>` - Git commits
  - `<C-g><C-t>` - Git tags

### Shell Features
- **Auto-suggestions**: Start typing for command suggestions
- **Syntax highlighting**: Real-time command syntax coloring
- **Smart completion**: Case-insensitive with menu selection
- **Directory shortcuts**: Auto-cd, pushd with duplicate ignore

## Customization

### Personal Settings
Create `~/.zshrc.local` for your own stuff (this won't be tracked by git):
```bash
# Example ~/.zshrc.local
export EDITOR="nvim"
alias ll="ls -la"
export PATH="$HOME/.local/bin:$PATH"
# Your secret API keys, work aliases, whatever
```

### Neovim Plugins
Each plugin gets its own file in `files/nvim/lua/plugins/`. LSP-related plugins go in `files/nvim/lua/plugins/lsp/`. Add new plugins, update playbook to symlink them, then run the playbook. Mason auto-installs LSP servers on first launch.

### Shell Modifications
Edit `files/zsh/.zshrc` for changes that should apply everywhere. Remember, this is my personal taste - your mileage may vary.

## Repository Structure
```
├── files/                  # Configuration files
│   ├── ghostty/config
│   ├── nvim/              # Neovim configuration
│   │   ├── init.lua
│   │   ├── nvim.md        # Keyboard shortcuts reference
│   │   └── lua/
│   │       ├── opts.lua
│   │       ├── keymaps.lua
│   │       ├── lazy-setup.lua
│   │       └── plugins/   # 18 plugin files
│   │           ├── init.lua
│   │           ├── colorscheme.lua
│   │           ├── nvim-tree.lua
│   │           ├── telescope.lua
│   │           ├── which-key.lua
│   │           ├── alpha.lua
│   │           ├── bufferline.lua
│   │           ├── lualine.lua
│   │           ├── dressing.lua
│   │           ├── vim-maximizer.lua
│   │           ├── treesitter.lua
│   │           ├── indent-blankline.lua
│   │           ├── autopairs.lua
│   │           ├── nvim-cmp.lua
│   │           ├── formatting.lua
│   │           ├── linting.lua
│   │           ├── gitsigns.lua
│   │           ├── lazygit.lua
│   │           └── lsp/
│   │               ├── mason.lua
│   │               └── lspconfig.lua
│   ├── tmux/.tmux.conf
│   ├── zed/settings.json
│   ├── zsh/.zshrc
│   └── starship/starship.toml
├── inventory/hosts        # Ansible inventory
├── playbook.yml          # Main Ansible playbook
├── CLAUDE.md             # Project guidance for Claude Code
└── README.md             # This file
```
