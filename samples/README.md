# Sample Code

This directory contains sample code in various programming languages for testing and validating Neovim configurations.

## Purpose

These samples are used to:
- Test debugging configurations (nvim-dap)
- Verify LSP functionality
- Validate language-specific plugins
- Proof-of-concept for new configurations

## Structure

```
samples/
├── python/     # Python samples for testing nvim-dap-python, Pyright, etc.
├── javascript/ # (future) JavaScript/TypeScript debugging
└── go/         # (future) Go debugging
```

## Guidelines

- **Keep it simple**: Samples should be minimal and focused
- **Basic samples are committed**: Simple demonstration code is tracked in git
- **Artifacts are ignored**: Build outputs, virtual environments, etc. are in .gitignore
- **Document the purpose**: Each language directory has a README explaining what it tests

## Usage

Open any sample file in Neovim to test the relevant configuration. Refer to the language-specific README for details on what features each sample demonstrates.
