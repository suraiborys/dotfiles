# Dotfiles

Personal dotfiles managed by [GNU Stow](https://www.gnu.org/software/stow/)

## Packages

- **ghostty** - Terminal emulator
- **helix** - Modal text editor
- **neovim** - Full IDE setup with LSP, formatting, linting, and git integration
- **tmux** - Terminal multiplexer with plugin manager and session persistence
- **zsh** - Shell with fzf, fd integration, and smart completions
- **starship** - Cross-shell prompt
- **skhd** - Keyboard shortcuts for app launching

## Prerequisites

Install GNU Stow:

### MacOS

```bash
brew install stow
```

### Ubuntu

```bash
apt-get install stow
```

## Installation

Clone the repository:

```bash
git clone https://github.com/suraiborys/dotfiles.git
cd dotfiles
```

Install packages (creates symlinks in `~`):

```bash
stow -t ~ {package_name}    # e.g. stow -t ~ nvim
```

Uninstall packages:

```bash
stow -t ~ -D {package_name}
```

**Note:** If stow encounters a conflict (name already exists and not owned by Stow), see [Conflicts](https://www.gnu.org/software/stow/manual/stow.html#Conflicts).

## Customization

Create `~/.zshrc.local` for personal settings (not tracked in git). For example:

```bash
export EDITOR="nvim"
alias ll="ls -la"
```
