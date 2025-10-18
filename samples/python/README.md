# Python Samples

Sample Python code for testing Neovim debugging and LSP configurations.

## Purpose

These samples are designed to test:
- **nvim-dap-python**: Python debugging with DAP (Debug Adapter Protocol)
- **Pyright LSP**: Type checking and language server features
- **Ruff**: Formatting and linting integration

## Files

### `basic.py`
Comprehensive but simple script demonstrating all key debugging features:
- **Breakpoints and stepping**: Functions to practice step over/into/out
- **Variable inspection**: Various data types (primitives, lists, dicts, objects)
- **Conditional breakpoints**: Loops with counters for conditional break testing
- **Exception handling**: Try/except blocks to test exception breakpoints

## How to Use

1. Open `basic.py` in Neovim
2. Set up nvim-dap-python (configuration coming soon)
3. Set breakpoints with `<leader>db` (or configured keymap)
4. Start debugging and test:
   - Step over/into/out
   - Inspect variables in different scopes
   - Test conditional breakpoints in loops
   - Break on exceptions

## Requirements

- Python 3.x
- debugpy (will be installed via Mason when nvim-dap-python is configured)
