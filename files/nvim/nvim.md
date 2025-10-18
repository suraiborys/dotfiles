# Neovim Keyboard Shortcuts Reference

Leader key: `<Space>`

---

## General Keymaps

| Keymap      | Mode   | Description                   |
| ----------- | ------ | ----------------------------- |
| `jk`        | Insert | Exit insert mode              |
| `<leader>+` | Normal | Increment number under cursor |
| `<leader>-` | Normal | Decrement number under cursor |

---

## Window Management

| Keymap       | Description                               |
| ------------ | ----------------------------------------- |
| `<leader>sv` | Split window vertically                   |
| `<leader>sh` | Split window horizontally                 |
| `<leader>se` | Make splits equal size                    |
| `<leader>sx` | Close current split                       |
| `<leader>sm` | Maximize/minimize a split (vim-maximizer) |

---

## Tab Navigation

| Keymap       | Description                    |
| ------------ | ------------------------------ |
| `<leader>to` | Open new tab                   |
| `<leader>tx` | Close current tab              |
| `<leader>tn` | Go to next tab                 |
| `<leader>tp` | Go to previous tab             |
| `<leader>tf` | Open current buffer in new tab |

---

## Code Folding

Treesitter-powered syntax-aware folding for functions, classes, blocks, etc.

| Keymap | Description                        |
| ------ | ---------------------------------- |
| `zf`   | Toggle fold under cursor           |
| `zF`   | Toggle fold and all nested folds   |
| `zO`   | Open all folds in file             |
| `zC`   | Close all folds in file            |

### Native Vim Folding Commands (also work)

- `zo` - Open fold under cursor
- `zc` - Close fold under cursor
- `zR` - Open all folds
- `zM` - Close all folds
- `zj` - Move to next fold
- `zk` - Move to previous fold

Files open with all folds expanded by default.

---

## File Explorer (nvim-tree)

| Keymap       | Description                          |
| ------------ | ------------------------------------ |
| `<leader>ee` | Toggle file explorer                 |
| `<leader>ef` | Toggle file explorer on current file |
| `<leader>ec` | Collapse file explorer               |
| `<leader>er` | Refresh file explorer                |

### Within nvim-tree

- `a` - Create new file/directory
- `d` - Delete file/directory
- `r` - Rename file/directory
- `x` - Cut file/directory
- `c` - Copy file/directory
- `p` - Paste file/directory
- `R` - Refresh tree
- `H` - Toggle hidden files
- `Enter` - Open file/expand directory
- `Ctrl-v` - Open in vertical split
- `Ctrl-x` - Open in horizontal split
- `Ctrl-t` - Open in new tab

---

## Fuzzy Finding (Telescope)

| Keymap       | Description                                   |
| ------------ | --------------------------------------------- |
| `<leader>ff` | Fuzzy find files in current directory         |
| `<leader>fr` | Fuzzy find recent files                       |
| `<leader>fs` | Find string in current directory (live grep)  |
| `<leader>fc` | Find string under cursor in current directory |

### Within Telescope

- `Ctrl-k` - Move to previous result
- `Ctrl-j` - Move to next result
- `Ctrl-q` - Send selected to quickfix list
- `Enter` - Open selection
- `Esc` - Close Telescope

---

## LSP (Language Server Protocol)

| Keymap       | Description                              |
| ------------ | ---------------------------------------- |
| `gR`         | Show LSP references (Telescope)          |
| `gD`         | Go to declaration                        |
| `gd`         | Show LSP definitions (Telescope)         |
| `gi`         | Show LSP implementations (Telescope)     |
| `gt`         | Show LSP type definitions (Telescope)    |
| `<leader>ca` | See available code actions               |
| `<leader>rn` | Smart rename symbol                      |
| `<leader>D`  | Show buffer diagnostics (Telescope)      |
| `<leader>d`  | Show line diagnostics (float)            |
| `[d`         | Go to previous diagnostic                |
| `]d`         | Go to next diagnostic                    |
| `K`          | Show documentation for item under cursor |
| `<leader>rs` | Restart LSP                              |

---

## Formatting & Linting

| Keymap       | Mode          | Description                      |
| ------------ | ------------- | -------------------------------- |
| `<leader>mp` | Normal/Visual | Format file or range             |
| `<leader>l`  | Normal        | Trigger linting for current file |

**Format on save is enabled by default** (1000ms timeout)

### Configured Formatters

- **Python**: Ruff (organize imports + format)
- **TypeScript/JavaScript/Vue**: Prettier
- **Lua**: Stylua
- **JSON/YAML/Markdown**: Prettier

### Configured Linters

- **Python**: Ruff
- **TypeScript/JavaScript/Vue**: ESLint

---

## Debugging (nvim-dap)

### Basic Debugging

| Keymap      | Description                      |
| ----------- | -------------------------------- |
| `<F5>`      | Start/Continue debugging         |
| `<F8>`      | Step Over                        |
| `<F9>`      | Step Into                        |
| `<F6>`      | Step Out                         |
| `<leader>t` | Toggle Breakpoint                |
| `<leader>T` | Conditional Breakpoint           |

### Debug Workflow

1. **Set breakpoints**: Press `<leader>t` on the line where you want to pause
2. **Start debugging**: Press `<F5>` - the debug UI will open automatically
3. **Step through code**: Use `<F8>` (step over), `<F9>` (step into), `<F6>` (step out)
4. **Inspect variables**: Check the Scopes panel in the debug UI (opens automatically)
5. **Continue**: Press `<F5>` to continue to the next breakpoint or end the session

### Debug UI Panels

When debugging, the UI opens automatically showing:
- **Scopes**: All variables in current scope (expand with Enter)
- **Breakpoints**: List of all breakpoints
- **Stacks**: Call stack and frames
- **Watches**: Custom expressions to monitor
- **REPL**: Interactive Python console in debug context
- **Console**: Program output

### Virtual Text

Variable values are shown inline next to your code as you debug (Neovim 0.10+).

---

## Git Integration

### Gitsigns (Inline Git Changes)

| Keymap       | Mode          | Description               |
| ------------ | ------------- | ------------------------- |
| `]h`         | Normal        | Next hunk                 |
| `[h`         | Normal        | Previous hunk             |
| `<leader>hs` | Normal/Visual | Stage hunk                |
| `<leader>hr` | Normal/Visual | Reset hunk                |
| `<leader>hS` | Normal        | Stage entire buffer       |
| `<leader>hR` | Normal        | Reset entire buffer       |
| `<leader>hu` | Normal        | Undo stage hunk           |
| `<leader>hp` | Normal        | Preview hunk              |
| `<leader>hb` | Normal        | Blame line (full)         |
| `<leader>hB` | Normal        | Toggle current line blame |
| `<leader>hd` | Normal        | Diff this                 |
| `<leader>hD` | Normal        | Diff this ~               |

### LazyGit

| Keymap       | Description                 |
| ------------ | --------------------------- |
| `<leader>lg` | Open LazyGit (full git TUI) |

---

## Navigation

### Jump List

- `Ctrl-o` - Jump to older position
- `Ctrl-i` - Jump to newer position

### Search

- `/pattern` - Search forward
- `?pattern` - Search backward
- `n` - Next search result
- `N` - Previous search result
- `*` - Search word under cursor forward
- `#` - Search word under cursor backward

### Line Navigation

- `0` - Beginning of line
- `^` - First non-blank character
- `$` - End of line
- `gg` - First line of file
- `G` - Last line of file
- `{line}G` - Go to specific line number

### Word/Paragraph Navigation

- `w` - Next word
- `b` - Previous word
- `e` - End of word
- `{` - Previous paragraph
- `}` - Next paragraph

---

## Treesitter (Syntax Highlighting)

### Incremental Selection

- `Ctrl-space` - Init selection / Increment selection
- `Backspace` - Decrement selection

---

## Auto-completion (nvim-cmp)

### In Insert Mode

- `Ctrl-k` - Previous suggestion
- `Ctrl-j` - Next suggestion
- `Ctrl-b` - Scroll docs up
- `Ctrl-f` - Scroll docs down
- `Ctrl-Space` - Show completion suggestions
- `Ctrl-e` - Close completion window
- `Enter` - Confirm selection

---

## Bufferline (Tab Bar)

Bufferline displays tabs at the top of the screen with a slant separator style.

---

## Additional Features

### Which-key

Press `<leader>` and wait 500ms to see available keybindings for your current context.

### Dressing

Improved UI for vim.ui.select and vim.ui.input (used by LSP and other plugins).

### Alpha

Custom greeting screen when opening Neovim without a file.

### Auto-pairs

Automatically closes brackets, quotes, and other pairs when typing.

### Indent Guides

Visual indent guides (character: `┊`) for better code readability.

---

## LSP Servers & Tools Installed

### Language Servers (via Mason)

- **TypeScript/JavaScript**: ts_ls, eslint
- **Python**: pyright, ruff
- **Web**: html, cssls, tailwindcss
- **Lua**: lua_ls

### Formatters & Linters (via Mason)

- prettier
- stylua
- eslint_d

---

## Tips

1. **Discover keybindings**: Press `<leader>` and wait to see which-key popup
2. **Format on save**: Enabled by default with 1s timeout
3. **Git changes**: Signs in the left column show added/modified/deleted lines
4. **LSP diagnostics**: Errors/warnings shown inline and in sign column
5. **Search across project**: Use `<leader>fs` for live grep
6. **File navigation**: Use `<leader>ff` for fuzzy file finding
7. **Git workflow**: Use `<leader>lg` for full LazyGit interface
