# Neovim Mappings Cheat Sheet

A comprehensive guide to all mappings in your Neovim configuration, organized by functionality.

## Table of Contents
- [File Operations](#file-operations)
- [Window Management](#window-management)
- [Buffer Management](#buffer-management)
- [Search & Navigation](#search--navigation)
- [Editing](#editing)
- [LSP & Code Intelligence](#lsp--code-intelligence)
- [Autocompletion](#autocompletion)
- [File Explorer](#file-explorer)
- [Fuzzy Finder](#fuzzy-finder)
- [Terminal](#terminal)
- [General Vim](#general-vim)

---

## File Operations

| Mapping | Description |
|---------|-------------|
| `<leader>w` | Save current file |
| `:w` | Save file (default) |
| `:wq` | Save and quit (default) |
| `:q!` | Quit without saving (default) |
| `:qa` | Quit all windows (default) |

---

## Window Management

### Window Navigation
| Mapping | Description |
|---------|-------------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to window below |
| `<C-k>` | Move to window above |
| `<C-l>` | Move to window on right |

### Window Creation
| Mapping | Description |
|---------|-------------|
| `<leader>sv` | Open file in vertical split (waits for file path) |
| `<leader>sf` | Open current file in vertical split |
| `<leader>sh` | Open file in horizontal split (waits for file path) |
| `<leader>sb` | Open current file in horizontal split |
| `:vsplit` | Vertical split (default) |
| `:split` | Horizontal split (default) |

### Window Resizing
| Mapping | Description |
|---------|-------------|
| `<leader>+` | Increase window height |
| `<leader>-` | Decrease window height |
| `<leader>>` | Increase window width |
| `<leader><` | Decrease window width |

### Window Control
| Mapping | Description |
|---------|-------------|
| `<leader>o` | Close all other panes (focus current) |
| `<leader>sw` | Swap files between panes |
| `<C-w>c` | Close current window (default) |
| `<C-w>o` | Close all other windows (default) |

---

## Buffer Management

| Mapping | Description |
|---------|-------------|
| `<leader>bf` | Go to first buffer |
| `<leader>bl` | Go to last buffer |
| `<leader>bp` | Go to previous buffer |
| `<leader>bn` | Go to next buffer |
| `<leader>bd` | Delete current buffer |
| `:bnext` | Next buffer (default) |
| `:bprev` | Previous buffer (default) |
| `:bd` | Delete buffer (default) |

---

## Search & Navigation

### Search
| Mapping | Description |
|---------|-------------|
| `<leader>h` | Clear search highlights manually |
| `/` | Search forward (default) |
| `?` | Search backward (default) |
| `n` | Next search result (default) |
| `N` | Previous search result (default) |
| `*` | Search for word under cursor (default) |
| `#` | Search for word under cursor backward (default) |

### File Search (Telescope)
| Mapping | Description |
|---------|-------------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search text in files) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Find help tags |
| `<leader>fo` | Find old files |

### Navigation
| Mapping | Description |
|---------|-------------|
| `gg` | Go to start of file (default) |
| `G` | Go to end of file (default) |
| `:number` | Go to line number (default) |
| `<C-o>` | Go back to previous location (default) |
| `<C-i>` | Go forward to next location (default) |

---

## Editing

### Basic Editing
| Mapping | Description |
|---------|-------------|
| `i` | Insert mode (default) |
| `a` | Append after cursor (default) |
| `o` | Insert new line below (default) |
| `O` | Insert new line above (default) |
| `x` | Delete character under cursor (default) |
| `dd` | Delete current line (default) |
| `yy` | Yank (copy) current line (default) |
| `p` | Paste after cursor (default) |
| `P` | Paste before cursor (default) |

### Visual Mode
| Mapping | Description |
|---------|-------------|
| `v` | Visual mode (default) |
| `V` | Visual line mode (default) |
| `<C-v>` | Visual block mode (default) |
| `y` | Yank selected text (default) |
| `d` | Delete selected text (default) |

### Undo/Redo
| Mapping | Description |
|---------|-------------|
| `u` | Undo (default) |
| `<C-r>` | Redo (default) |

### Surround (Plugin)
| Mapping | Description |
|---------|-------------|
| `ys` | Surround with (default) |
| `ds` | Delete surrounding (default) |
| `cs` | Change surrounding (default) |

---

## LSP & Code Intelligence

| Mapping | Description |
|---------|-------------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gr` | Find references |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>gf` | Format buffer |

---

## Autocompletion

| Mapping | Description |
|---------|-------------|
| `<C-Space>` | Force completion menu |
| `<C-e>` | Close completion menu |
| `<Tab>` | Select next item or expand snippet |
| `<S-Tab>` | Select previous item or jump snippet |
| `<CR>` | Confirm selection or insert newline |

---

## File Explorer

| Mapping | Description |
|---------|-------------|
| `<C-n>` | Toggle Neo-tree filesystem reveal left |
| `<C-c>` | Close Neo-tree |

---

## Terminal

| Mapping | Description |
|---------|-------------|
| `<leader>tb` | Open terminal in bottom split |
| `<leader>tr` | Open terminal in right split |
| `<C-\>` | Toggle terminal (default) |
| `<C-w>N` | Enter terminal normal mode (default) |

---

## General Vim

### Mode Navigation
| Mapping | Description |
|---------|-------------|
| `Esc` | Return to normal mode (default) |
| `<C-[>` | Return to normal mode (default) |
| `:` | Command mode (default) |
| `/` | Search mode (default) |

### Text Objects
| Mapping | Description |
|---------|-------------|
| `iw` | Inner word (default) |
| `aw` | A word (default) |
| `i"` | Inner quotes (default) |
| `a"` | A quotes (default) |
| `i(` | Inner parentheses (default) |
| `a(` | A parentheses (default) |
| `i{` | Inner braces (default) |
| `a{` | A braces (default) |

### Marks
| Mapping | Description |
|---------|-------------|
| `ma` | Set mark 'a' (default) |
| `'a` | Jump to mark 'a' (default) |
| `:marks` | Show all marks (default) |

### Macros
| Mapping | Description |
|---------|-------------|
| `qa` | Start recording macro 'a' (default) |
| `q` | Stop recording (default) |
| `@a` | Execute macro 'a' (default) |
| `@@` | Execute last macro (default) |

### Folding
| Mapping | Description |
|---------|-------------|
| `za` | Toggle fold (default) |
| `zo` | Open fold (default) |
| `zc` | Close fold (default) |
| `zR` | Open all folds (default) |
| `zM` | Close all folds (default) |

### Treesitter (Incremental Selection)
| Mapping | Description |
|---------|-------------|
| `gnn` | Init selection |
| `grn` | Node incremental |
| `grc` | Scope incremental |
| `grm` | Node decremental |

---

## Quick Reference

### Most Used Custom Mappings
- `<leader>ff` - Find files
- `<leader>fg` - Search in files
- `<C-n>` - File explorer
- `<leader>w` - Save file
- `<C-h/j/k/l>` - Window navigation
- `<leader>bp/bn` - Buffer navigation

### Essential Default Mappings
- `i` - Insert mode
- `Esc` - Normal mode
- `:w` - Save
- `:q` - Quit
- `/` - Search
- `n` - Next search result
- `gg` - Start of file
- `G` - End of file

### LSP Shortcuts
- `gd` - Go to definition
- `gr` - Find references
- `K` - Hover documentation
- `<leader>ca` - Code actions

---

## Tips

- **Leader Key**: Space (custom)
- **Most operations**: Start in normal mode
- **Search**: Use Telescope for file/content search
- **LSP**: Automatically available for supported languages
- **Autocompletion**: Tab to navigate, Enter to confirm
- **Windows**: Use `<C-h/j/k/l>` for quick navigation
- **Buffers**: Use `<leader>bp/bn` for buffer switching

---

*Remember: This configuration uses Lazy.nvim for plugin management and Mason for LSP servers. Most language-specific features will work automatically once LSP servers are installed.* 