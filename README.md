# Neovim Configuration

This repository contains my personal Neovim configuration built with Lazy.nvim plugin manager. The configuration is organized with clear separation between general Neovim settings and plugin-specific configurations.

## Table of Contents
- [General Neovim Settings](#general-neovim-settings)
- [General Keymaps](#general-keymaps)
- [Plugins](#plugins)
  - [File Explorer](#file-explorer)
  - [Fuzzy Finder](#fuzzy-finder)
  - [Language Server Protocol](#language-server-protocol)
  - [Autocompletion](#autocompletion)
  - [Syntax Highlighting](#syntax-highlighting)
  - [Status Line](#status-line)
  - [Theme](#theme)
  - [Git Integration](#git-integration)
  - [Utilities](#utilities)

## General Neovim Settings

### Basic Settings
- **Indentation**: 4 spaces, expand tabs
- **Line Numbers**: Both absolute and relative line numbers enabled
- **Leader Key**: Space
- **Clipboard**: Integrated with system clipboard

### UI Settings
- **True Color Support**: Enabled for better color display
- **Search**: Case-insensitive with smart case (case-sensitive when uppercase used)
- **Search Highlighting**: Enabled with incremental search
- **Cursor**: Highlighted current line
- **Scroll**: 8 lines/columns offset from edges
- **Line Wrapping**: Disabled
- **Mode Display**: Hidden (handled by status line)
- **Sign Column**: Always visible

### Performance Settings
- **Update Time**: 250ms for faster completion
- **Timeout Length**: 300ms for key sequence completion

## General Keymaps

### File Operations
- `<leader>w` - Save current file

### Window Management
- `<leader>sv` - Open file in vertical split (waits for file path)
- `<leader>sf` - Open current file in vertical split
- `<leader>sh` - Open file in horizontal split (waits for file path)
- `<leader>sb` - Open current file in horizontal split
- `<leader>o` - Close all other panes

### Window Navigation
- `<C-h>` - Move to left window
- `<C-j>` - Move to window below
- `<C-k>` - Move to window above
- `<C-l>` - Move to right window

### Window Resizing
- `<leader>+` - Increase window height
- `<leader>-` - Decrease window height
- `<leader>>` - Increase window width
- `<leader><` - Decrease window width

### Terminal
- `<leader>tb` - Open terminal in bottom split
- `<leader>tr` - Open terminal in right split

### Buffer Management
- `<leader>bf` - Go to first buffer
- `<leader>bl` - Go to last buffer
- `<leader>bp` - Go to previous buffer
- `<leader>bn` - Go to next buffer
- `<leader>bd` - Delete current buffer

### File Swapping
- `<leader>sw` - Swap files between panes

### Search
- `<leader>h` - Clear search highlights manually
- **Auto-clear**: Search highlights automatically cleared when entering insert mode

## Plugins

### File Explorer

**Plugin**: `nvim-neo-tree/neo-tree.nvim`

**Purpose**: Modern file explorer with tree view, git integration, and file operations.

**Settings**:
- Branch: v3.x
- Dependencies: plenary.nvim, nvim-web-devicons, nui.nvim
- Filtered items visible
- Show dotfiles and gitignored files

**Keymaps**:
- `<C-n>` - Toggle Neo-tree filesystem reveal left
- `<C-c>` - Close Neo-tree

### Fuzzy Finder

**Plugin**: `nvim-telescope/telescope.nvim`

**Purpose**: Fuzzy finder for files, text, buffers, and more with ripgrep integration.

**Settings**:
- Uses ripgrep for live grep with smart case
- Shows line numbers and columns
- Ignores git, node_modules, lock files, and cache directories
- Includes hidden files in find_files
- UI-select extension for dropdown themes

**Keymaps**:
- `<leader>ff` - Find files
- `<leader>fg` - Live grep (search text in files)
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help tags
- `<leader>fo` - Find old files

### Language Server Protocol

**Plugin**: `neovim/nvim-lspconfig` + `williamboman/mason.nvim` + `williamboman/mason-lspconfig.nvim`

**Purpose**: Language server support for intelligent code completion, diagnostics, and navigation.

**Settings**:
- **Diagnostic Signs**: Custom icons for different severity levels
  - Error: ✘
  - Warning: ▲
  - Info: ►
  - Hint: •
- **Virtual Text**: Only shows warnings and above
- **Severity Sort**: Enabled

**Supported Languages**:
- **Lua**: lua_ls with Neovim globals ignored
- **Python**: Pyright with unused variable/function warnings disabled
- **C/C++**: Clangd with background indexing and clang-tidy
- **TypeScript/JavaScript**: ts_ls

**Keymaps** (applied to all LSP buffers):
- `K` - Hover documentation
- `gd` - Go to definition
- `gr` - Find references
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `<leader>gf` - Format buffer

### Autocompletion

**Plugin**: `hrsh7th/nvim-cmp` + `L3MON4D3/LuaSnip`

**Purpose**: Intelligent autocompletion with LSP integration and snippet support.

**Settings**:
- LSP integration via cmp-nvim-lsp
- Buffer and path completion
- VSCode-style snippet loading
- Integration with nvim-autopairs

**Keymaps**:
- `<C-Space>` - Force completion menu
- `<C-e>` - Close completion menu
- `<Tab>` - Select next item or expand snippet
- `<S-Tab>` - Select previous item or jump snippet
- `<CR>` - Confirm selection or insert newline

### Syntax Highlighting

**Plugin**: `nvim-treesitter/nvim-treesitter`

**Purpose**: Advanced syntax highlighting, indentation, and code manipulation.

**Settings**:
- Auto-install parsers
- Ensured parsers: lua, python, javascript, html, css, c
- Syntax highlighting enabled
- Indentation enabled
- Incremental selection enabled

**Keymaps**:
- `gnn` - Init selection
- `grn` - Node incremental
- `grc` - Scope incremental
- `grm` - Node decremental

### Status Line

**Plugin**: `nvim-lualine/lualine.nvim`

**Purpose**: Modern status line with git integration and file information.

**Settings**:
- Theme: gruvbox-material
- Global status line across splits
- Icons enabled (requires nvim-web-devicons)
- Extensions: neo-tree, quickfix

**Sections**:
- **A**: Buffers
- **B**: Branch, diff, diagnostics
- **C**: File name
- **X**: File type
- **Z**: Location (line/column)

### Theme

**Plugin**: `sainnhe/gruvbox-material`

**Purpose**: Material design variant of the Gruvbox color scheme.

**Settings**:
- Background: hard
- Foreground: material palette
- Italics and bold enabled
- Transparent background
- Performance optimization enabled
- Custom highlights for line numbers and status line

### Git Integration

**Plugin**: `lewis6991/gitsigns.nvim`

**Purpose**: Git status indicators in the sign column.

**Settings**:
- Event: BufReadPre, BufNewFile
- Sign column enabled
- Custom signs:
  - Add: +
  - Change: │
  - Delete: _
  - Top delete: ‾
  - Changedelete: ~

### Utilities

#### Auto Pairs
**Plugin**: `windwp/nvim-autopairs`

**Purpose**: Automatically close brackets, quotes, and other pairs.

**Settings**:
- Treesitter integration enabled
- Disabled in TelescopePrompt and vim filetypes
- Integration with nvim-cmp for completion

#### Surround
**Plugin**: `kylechui/nvim-surround`

**Purpose**: Surround text with brackets, quotes, or other delimiters.

**Settings**:
- Latest stable version
- Event: VeryLazy
- Default configuration

## Installation

### Prerequisites
- Neovim (v0.8 or higher)
- Git
- Node.js (for TypeScript/JavaScript LSP)
- Python 3 (for Python LSP)
- C/C++ compiler (for Clangd LSP)

### Setup
1. Clone this repository to a temporary location
2. Run the installation script: `./install.sh`
3. The script will install all dependencies and copy configuration files
4. Restart your terminal or run: `source ~/.bashrc`
5. Start Neovim: `nvim`
6. Wait for plugins to install automatically

### Manual Installation (if script fails)
If the installation script doesn't work, install dependencies manually:

**System Dependencies:**
```bash
sudo apt update
sudo apt install -y neovim nodejs npm python3 python3-pip python3-dev build-essential clang ripgrep git curl wget unzip lua5.4 liblua5.4-dev
```

**LSP Servers:**
```vim
:MasonInstall lua_ls pyright clangd ts_ls
```

**Formatters:**
```vim
:MasonInstall black clang-format stylua flake8 isort
```

**Treesitter Parsers:**
```vim
:TSInstall lua python javascript html css c
```

## Usage Tips

### Getting Started
1. Use `<leader>ff` to find files quickly
2. Use `<C-n>` to open the file explorer
3. Use `gd` to jump to definitions in supported languages
4. Use `<leader>fg` to search for text across your project
5. Use `<leader>bp/bn` to navigate between buffers

### LSP Features
- Hover over symbols with `K` to see documentation
- Use `<leader>ca` for code actions and quick fixes
- Use `<leader>rn` to rename symbols across your project
- Use `<leader>gf` to format your code

### Window Management
- Use `<C-h/j/k/l>` for quick window navigation
- Use `<leader>+/-` and `<leader></>` for window resizing
- Use `<leader>o` to focus on the current window

## Troubleshooting

### Plugins Not Loading
- Check if Lazy.nvim is properly installed
- Run `:Lazy sync` to sync plugins
- Check for syntax errors in plugin files

### LSP Not Working
- Run `:LspInfo` to check LSP status
- Run `:Mason` to install missing LSP servers
- Check if language servers are installed on your system

### Performance Issues
- Disable unused plugins by commenting them out
- Check for large files or directories being indexed
- Monitor plugin loading times with `:Lazy profile`

## Configuration Structure

```
~/.config/nvim/
├── init.lua              # Main entry point
├── lua/
│   ├── settings.lua      # General Neovim settings
│   ├── keymaps.lua       # General keymaps
│   └── plugins/          # Plugin configurations
│       ├── auto-cmp.lua
│       ├── autopairs.lua
│       ├── gitsigns.lua
│       ├── gruvbox.lua
│       ├── lsp-config.lua
│       ├── lualine.lua
│       ├── neo-tree.lua
│       ├── surround.lua
│       ├── telescope.lua
│       └── treesitter.lua
└── lazy-lock.json        # Plugin lock file
```

## Credits

This configuration is built on top of the excellent Neovim ecosystem with plugins from the community. Special thanks to the maintainers of Lazy.nvim, nvim-lspconfig, and all the other plugins that make this setup possible.

