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
│   └── lua/
│       ├── opts.lua           # Vim options
│       ├── keymaps.lua        # Key mappings
│       ├── lazy-setup.lua     # Plugin manager setup
│       └── plugins/
│           ├── init.lua       # Basic plugins list
│           ├── colorscheme.lua # Tokyo Night theme
│           └── nvim-tree.lua  # File explorer
├── tmux/.tmux.conf            # Tmux with TPM plugin manager
├── zed/settings.json          # Zed editor settings
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
- **Plugin Manager**: lazy.nvim with priority loading
- **Colorscheme**: Tokyo Night with custom color overrides
- **File Explorer**: nvim-tree with custom keybindings
- **Navigation**: vim-tmux-navigator for seamless pane switching

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

## Development Notes

- Use the playbook for all configuration changes
- Never create manual symlinks - always update playbook
- Test changes with `--check` flag before applying
- Local settings go in `~/.zshrc.local`, not the repo