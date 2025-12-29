# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles repository using Ansible for automated configuration management. Manages development tools configuration with modern CLI integrations including fzf, fd, and comprehensive Neovim setup.

## Architecture

- **Ansible Playbook**: Single `playbook.yml` file orchestrating all configuration
- **Inventory**: Local host configuration in `inventory/hosts`
- **Configuration Files**: All dotfiles in `files/` directory, organized by application
- **Symlink Strategy**: Ansible creates symbolic links from home directory to repository files
- **External Dependencies**: Clones external repositories (TPM, fzf-git.sh) to home directory
- **Local Config Support**: `.zshrc.local` for user-specific settings (not in repo)

## Common Commands

### Setup and Installation
```bash
# Install all dotfiles configurations
ansible-playbook -i inventory/hosts playbook.yml

# Test playbook without making changes
ansible-playbook -i inventory/hosts playbook.yml --check

# Run with verbose output
ansible-playbook -i inventory/hosts playbook.yml -v
```

### Development Tasks
```bash
# Check Ansible syntax
ansible-playbook --syntax-check playbook.yml

# List all tasks that would be executed
ansible-playbook -i inventory/hosts playbook.yml --list-tasks
```

## File Structure

```
files/
├── ghostty/config               # Terminal emulator config
├── nvim/                       # Neovim configuration
│   ├── init.lua               # Main config entry point
│   ├── nvim.md                # Keyboard shortcuts reference
│   └── lua/
│       ├── opts.lua           # Vim options
│       ├── keymaps.lua        # Key mappings
│       ├── lazy-setup.lua     # Plugin manager setup
│       └── plugins/
│           ├── init.lua            # Basic plugins list
│           ├── colorscheme.lua     # Tokyo Night theme
│           ├── nvim-tree.lua       # File explorer
│           ├── telescope.lua       # Fuzzy finder
│           ├── which-key.lua       # Keymap hints
│           ├── alpha.lua           # Greeting screen
│           ├── bufferline.lua      # Tab bar
│           ├── lualine.lua         # Status line
│           ├── dressing.lua        # Better UI
│           ├── vim-maximizer.lua   # Split maximizer
│           ├── treesitter.lua      # Syntax highlighting
│           ├── indent-blankline.lua # Indent guides
│           ├── autopairs.lua       # Auto-close pairs
│           ├── nvim-cmp.lua        # Completion engine
│           ├── formatting.lua      # conform.nvim
│           ├── linting.lua         # nvim-lint
│           ├── gitsigns.lua        # Git integration
│           ├── lazygit.lua         # Git TUI
│           ├── debug.lua           # DAP debugger
│           ├── ufo.lua             # Code folding
│           └── lsp/
│               ├── mason.lua       # LSP installer
│               └── lspconfig.lua   # LSP configuration
├── skhd/skhdrc                # Keyboard shortcuts for app launching
├── tmux/.tmux.conf            # Tmux with TPM plugin manager
├── zsh/.zshrc                 # ZSH with fzf, fd, plugins
└── starship/starship.toml     # Starship prompt config
```

## Configuration Management

### Symlink Strategy
- All configurations are version-controlled and applied via symbolic links
- Home directory files point to repository files
- Local customizations via `~/.zshrc.local` (not tracked)

### External Dependencies
- **TPM**: Cloned to `~/.tmux/plugins/tpm` for tmux plugin management
- **fzf-git.sh**: Cloned to `~/fzf-git.sh` for enhanced git-fzf integration
- Both auto-cloned by playbook if not present

### Plugin Management
- **Neovim**: lazy.nvim with automatic plugin installation
- **ZSH**: Conditional loading of system plugins (autosuggestions, syntax-highlighting)
- **Tools**: Conditional setup based on tool availability (fzf, fd, starship)

## Key Features

### Neovim Setup
- **Plugin Manager**: lazy.nvim with automatic plugin installation
- **Colorscheme**: Tokyo Night with custom color overrides
- **File Explorer**: nvim-tree with git integration and custom keybindings
- **Fuzzy Finder**: Telescope with fzf-native for fast file/string searching
- **LSP Integration**:
  - Python: Pyright (type checking) + Ruff (formatting/linting)
  - TypeScript/JavaScript: ts_ls + ESLint
  - Web: HTML, CSS, TailwindCSS
  - Lua: lua_ls
- **Formatting**: conform.nvim with format-on-save (Ruff, Prettier, Stylua)
- **Linting**: nvim-lint with automatic triggers (Ruff, ESLint)
- **Completion**: nvim-cmp with LSP, buffer, path, and snippet sources
- **Git Integration**:
  - gitsigns.nvim for inline git changes, blame, and hunk operations
  - lazygit.nvim for full git TUI
- **UI Enhancements**:
  - lualine (statusline)
  - bufferline (tab bar)
  - which-key (keymap hints)
  - alpha (greeting screen)
  - dressing (better UI components)
- **Code Features**:
  - Treesitter syntax highlighting
  - Auto-pairs for brackets/quotes
  - Indent guides
  - Split window maximizer
- **Documentation**: `nvim.md` contains all keyboard shortcuts reference

### Shell Enhancement
- **FZF Integration**: File/directory fuzzy finding with fd backend
- **Git Integration**: fzf-git.sh for branch/commit/file searching
- **Conditional Loading**: All tools check for availability before setup
- **Local Config**: Support for private settings in `~/.zshrc.local`

## Prerequisites

- Ansible installed on target system
- macOS environment (primary target)
- Git (for external repository cloning)
- Nerd Font for proper icon rendering
- Node.js (for TypeScript LSP servers)
- Python 3.x with uv (Astral's package manager)
- Ripgrep (for Telescope live grep)
- fd (for Telescope file finding)
- lazygit (for git TUI integration)

## Development Notes

- Use the playbook for all configuration changes
- Never create manual symlinks - always update playbook
- Test changes with `--check` flag before applying
- Local settings go in `~/.zshrc.local`, not the repo
- Each Neovim plugin should be in its own file in `files/nvim/lua/plugins/`
- LSP-related plugins go in `files/nvim/lua/plugins/lsp/`
- All keyboard shortcuts are documented in `files/nvim/nvim.md`
- Mason auto-installs LSP servers, formatters, and linters on first run
- Format-on-save is enabled by default with 1000ms timeout