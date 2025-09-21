# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository that uses Ansible for automated configuration management across macOS/Linux environments. The repository manages configuration files for development tools including ghostty, zed, nvim, and tmux.

## Architecture

- **Ansible Playbook**: Single `playbook.yml` file that orchestrates all configuration setup
- **Inventory**: Simple local host configuration in `inventory/hosts`
- **Configuration Files**: All dotfiles stored in `files/` directory, organized by application
- **Symlink Strategy**: Ansible creates symbolic links from `~/.config/` to repository files

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
├── ghostty/config          # Terminal emulator config
├── nvim/init.lua          # Neovim configuration
├── tmux/.tmux.conf        # Tmux with TPM plugin manager
└── zed/settings.json      # Zed editor settings
```

## Configuration Management

- All configurations are version-controlled and applied via symbolic links
- Tmux configuration includes TPM (Tmux Plugin Manager) with auto-restore functionality
- The playbook ensures directories exist before creating symlinks
- Git repository for TPM is cloned automatically during setup

## Prerequisites

- Ansible must be installed on the target system
- macOS or Linux shell environment
- Git (for TPM installation)