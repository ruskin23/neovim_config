# Neovim Configuration

This repository contains my Neovim configuration. An `install.sh` script is included to set everything up easily.

---
## **Installed Plugins**

- `auto-cmp.lua`: Autocompletion configuration.
- `autopairs.lua`: Automatically close pairs like brackets and quotes.
- `bufferline.lua`: Enhanced buffer line with tabs.
- `diagnostics.lua`: Displays LSP diagnostics with custom icons.
- `gitsigns.lua`: Git integration with inline signs.
- `gruvbox.lua`: Gruvbox theme for Neovim.
- `lsp-config.lua`: Configuration for Language Server Protocol (LSP).
- `lualine.lua`: Status line plugin.
- `neo-tree.lua`: File explorer for Neovim.
- `non-ls.lua`: Null-LS configuration for formatters and linters.
- `telescope.lua`: Fuzzy finder for files, symbols, and more.
- `treesitter.lua`: Better syntax highlighting and code folding.

## Features

### **Key Mappings**

#### **LSP Mappings**
| Shortcut       | Action                                   |
|----------------|-----------------------------------------|
| `K`            | See hover documentation                |
| `gd`           | Go to the definition of a symbol       |
| `gr`           | Find all references to a symbol        |
| `<leader>ca`   | Apply quick fixes or code suggestions  |
| `<leader>rn`   | Rename symbols project-wide            |
| `<leader>gf`   | Format the file                        |
| `<C-o>`        | Return to the previous location        |

#### **Neo-tree Mappings**
| Shortcut       | Action                                   |
|----------------|-----------------------------------------|
| `<C-n>`        | Open Neo-tree and reveal the file       |
| `<C-Left>`     | Focus Neo-tree                         |
| `<C-Right>`    | Focus the file buffer                  |
| `<C-q>`        | Close Neo-tree                         |

#### **Autocomplete**
| Shortcut       | Action                                   |
|----------------|-----------------------------------------|
| `<Tab>`        | Cycle forward through suggestions       |
| `<S-Tab>`      | Cycle backward through suggestions      |
| `<Ctrl>+Space` | Force open completion menu              |
| `<Ctrl>+e`     | Close completion menu                   |
| `<Enter>`      | Accept selected completion              |

#### **Split Management**
| Shortcut       | Action                                              |
|----------------|----------------------------------------------------|
| `<leader>sv`   | Open a file in a vertical split (waits for a file path) |
| `<leader>sf`   | Open the current file in a vertical split          |
| `<leader>sh`   | Open a file in a horizontal split (waits for a file path) |
| `<leader>sb`   | Open the current file in a horizontal split        |
| `<leader>o`    | Close all other panes                              |

#### **Split Navigation**
| Shortcut       | Action                                   |
|----------------|-----------------------------------------|
| `<C-h>`        | Move to the split on the left           |
| `<C-j>`        | Move to the split below                 |
| `<C-k>`        | Move to the split above                 |
| `<C-l>`        | Move to the split on the right          |

#### **Resize Panes**
| Shortcut       | Action                                   |
|----------------|-----------------------------------------|
| `<leader>+`    | Increase pane height                    |
| `<leader>-`    | Decrease pane height                    |
| `<leader>>`    | Increase pane width                     |
| `<leader><`    | Decrease pane width                     |

#### **Pane and File Management**
| Shortcut       | Action                                   |
|----------------|-----------------------------------------|
| `<leader>sw`   | Swap files between panes                |

#### **Buffer Management**
| Shortcut       | Action                                   |
|----------------|-----------------------------------------|
| `tk`           | Go to the last buffer                   |
| `tj`           | Go to the first buffer                  |
| `th`           | Go to the previous buffer               |
| `tl`           | Go to the next buffer                   |
| `td`           | Delete the current buffer               |

#### **Search and Highlights**
| Shortcut       | Action                                   |
|----------------|-----------------------------------------|
| `<leader>h`    | Clear search highlights manually        |
| Enter Insert Mode | Automatically clears search highlights |

#### **Telescope**
| Shortcut       | Action                                   |
|----------------|-----------------------------------------|
| `<leader>ff`   | Find files                              |
| `<leader>fg`   | Search for text in files (`live_grep`)  |


---

### **Visual Enhancements**
- **Diagnostic Signs**:
  - `✘` (Error): Serious issues (e.g., syntax errors).
  - `▲` (Warning): Potential problems.
  - `►` (Information): Informational hints.
  - `•` (Hint): Style suggestions or optional improvements.

- **Git Signs**:
  - `+`: New lines not in the last commit.
  - `│`: Modified lines since last commit.
  - `_`: Deleted lines.
  - `?`: Untracked files.

---

### **Supported Languages**

1. **Python**:
   - LSP: Pyright.
   - Formatting: Built-in.

2. **Lua**:
   - LSP: Lua language server (`lua_ls`).
   - Diagnostics configured to ignore Neovim globals like `vim`.

3. **C/C++**:
   - LSP: Clangd.

4. **JavaScript/React**:
   - TreeSitter: Syntax highlighting and folding.
   - LSP (Optional): Can be added for smarter features like code completion and error checking.

---

## Installation

### **Dependencies**
Ensure you have the following installed:
- Neovim (v0.8 or higher)
- Git
- Node.js (for JavaScript LSPs)
- Python 3 (with `pip` for Python LSP)
- C Compiler (e.g., GCC/Clang for Clangd LSP)

### **Install Script**
Run the `install.sh` script to install Neovim and all required dependencies:
```bash
chmod +x install.sh
./install.sh
```

This will:
- Install Neovim and plugins.
- Set up LSP servers for Python, Lua, C/C++.
- Install Node.js for JavaScript/React TreeSitter support.

---

## How to Use

### **Open Neovim**
```bash
nvim
```

### **Explore Neo-tree**
1. Press `<C-n>` to open Neo-tree.
2. Use `<C-Left>` and `<C-Right>` to navigate between the sidebar and file buffer.
3. Press `<C-q>` to close Neo-tree.

### **Code Navigation**
- Jump to definitions with `gd`.
- Find references with `gr`.
- Go back to the previous location with `<C-o>`.

### **Git Integration**
- See signs (`+`, `_`, `|`, etc.) in the sign column for changes in files.
- Use Git commands (`git add`, `git commit`, etc.) in the integrated terminal.

---

## Customization
This configuration is modular, so you can easily add or modify plugins. Key files include:
- `init.lua`: Main Neovim configuration.
- `plugins/`: Directory for managing plugins.
- `lsp-config.lua`: LSP setup for different languages.

---

## Troubleshooting

### **LSP Not Working?**
- Run `:LspInfo` to check if the language server is running.
- Restart the LSP with `:LspRestart`.

### **Plugins Not Installing?**
- Ensure your internet connection is active.
- Run `:PackerSync` or `:Lazy sync` (depending on the plugin manager).

---

## Credits
Claude and GPT-4o. Although they failed at times, then I had to dig through documentation. Why do LSP exist again?

