# DOTFILES

Automated dotfiles setup using Ansible for personal developer experience.

**Note**: If you want to use these configs, check the files in `/files` directory directly rather than running the playbook.

**Disclaimer**: No warranty that applying the playbook or configs won't break your system. No security warranty. Use at your own risk.

## Prerequisites
- Ansible installed (e.g., via pip or your package manager)
- macOS/Linux shell environment

## Available dotfiles
- [x] ghostty
- [x] zed
- [x] nvim
- [X] tmux

## Quick Start
```bash
ansible-playbook -i inventory/hosts playbook.yml
```
