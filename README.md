# Dotfiles

Personal dotfiles managed with Ansible for macOS development environment.

**Note**: This repository is for personal use. Co-created with Claude. Use at your own risk.

## What's Configured

- **ghostty** - Terminal emulator with quick terminal support
- **neovim** - Full IDE setup with LSP, formatting, linting, and git integration
- **tmux** - Terminal multiplexer with plugin manager and session persistence
- **zsh** - Shell with fzf, fd integration, and smart completions
- **starship** - Cross-shell prompt
- **skhd** - Keyboard shortcuts for app launching

## Installation

```bash
ansible-playbook -i inventory/hosts playbook.yml
```

## Structure

```
files/
├── ghostty/config           # Terminal emulator
├── nvim/                    # Neovim with 22 plugins
│   ├── init.lua
│   ├── nvim.md             # Keybindings reference
│   └── lua/plugins/        # Plugin configurations
├── tmux/.tmux.conf         # Tmux with resurrect/continuum
├── zsh/.zshrc              # Shell configuration
├── starship/starship.toml  # Prompt configuration
└── skhd/skhdrc             # Keyboard shortcuts
```

## Neovim Features

- **LSP**: Python (Pyright, Ruff), TypeScript (ts_ls), Lua, HTML, CSS, TailwindCSS
- **Tools**: Telescope, nvim-tree, which-key, lazygit, treesitter
- **UI**: Tokyo Night theme, lualine, bufferline, alpha dashboard
- **Quality**: Auto-formatting, linting, completion, git integration

See `files/nvim/nvim.md` for complete keybindings.

## Customization

For personal settings not tracked in git:
```bash
# Create ~/.zshrc.local
export EDITOR="nvim"
alias ll="ls -la"
```
