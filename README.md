# DOTFILES

Automated dotfiles setup using Ansible for personal developer experience.

**Note**: If you want to use these configs, check the files in `/files` directory directly rather than running the playbook.

**Disclaimer**: No warranty that applying the playbook or configs won't break your system. No security warranty. Use at your own risk.

## Prerequisites
- Ansible installed (e.g., via pip or your package manager)
- macOS shell environment (primary target)
- Nerd Font installed for proper terminal rendering

**Platform Compatibility:**
- **macOS**: Supported
- **Ubuntu/Linux**: Can work with tweaks to paths and package installation commands in the playbook

## Available dotfiles
- [x] ghostty
- [x] zed
- [x] nvim
- [x] tmux
- [x] zsh
- [x] starship

## Quick Start
```bash
ansible-playbook -i inventory/hosts playbook.yml
```
