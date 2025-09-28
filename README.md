# DOTFILES

Personal dotfiles setup using Ansible. Works on my machine)))

**Note**: This is my personal setup. If you want to use these configs, check the files in `/files` directory directly rather than running the playbook on your system.

**Disclaimer**: No warranty that applying the playbook or configs won't break your system. Made public for convenience, not because it's production-ready. Use at your own risk and don't blame me if something explodes.

## Prerequisites
- Ansible installed (e.g., via pip or your package manager)
- macOS shell environment (primary target)
- Nerd Font installed for proper terminal rendering

**Optional Dependencies (auto-detected):**
- `fzf` - Fuzzy finder for enhanced shell experience
- `fd` - Fast alternative to find (improves fzf performance)
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
- **File Explorer**: nvim-tree with intuitive keybindings
- **Navigation**: vim-tmux-navigator for seamless window switching
- **Utility**: plenary.nvim for Lua functions

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
- **Leader key**: `Space`
- **File Explorer**: `<leader>ee` - Toggle, `<leader>ef` - Focus current file
- **Lazy Plugin Manager**: `:Lazy` - Open plugin interface
- **Window Navigation**: `<C-h/j/k/l>` - Navigate between vim/tmux panes

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
Add plugins to `files/nvim/lua/plugins/` directory and link via playbook. Or just copy the files manually if you don't trust my Ansible setup.

### Shell Modifications
Edit `files/zsh/.zshrc` for changes that should apply everywhere. Remember, this is my personal taste - your mileage may vary.

## Repository Structure
```
├── files/                  # Configuration files
│   ├── ghostty/config
│   ├── nvim/              # Neovim configuration
│   │   ├── init.lua
│   │   └── lua/
│   │       ├── opts.lua
│   │       ├── keymaps.lua
│   │       ├── lazy-setup.lua
│   │       └── plugins/
│   ├── tmux/.tmux.conf
│   ├── zed/settings.json
│   ├── zsh/.zshrc
│   └── starship/starship.toml
├── inventory/hosts        # Ansible inventory
└── playbook.yml          # Main Ansible playbook
```
