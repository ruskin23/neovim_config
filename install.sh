#!/bin/bash

# Directory where your Neovim configuration is located (adjust as needed)
CONFIG_DIR="$HOME/.config/nvim"

# Change to the directory where this script is located
cd "$CONFIG_DIR"

# Check if Neovim is installed, if not, install it
if ! command -v nvim &> /dev/null
then
    echo "Neovim not found. Installing Neovim..."
    
    # Ubuntu/Debian installation
    sudo apt update
    sudo apt install -y neovim
    
    # For macOS, uncomment the following line:
    # brew install neovim
else
    echo "Neovim is already installed."
fi

# Install Node.js and npm if not installed (required for Pyright and other LSPs)
if ! command -v node &> /dev/null
then
    echo "Node.js not found. Installing Node.js and npm..."
    
    # Ubuntu/Debian installation
    sudo apt install -y nodejs npm
    
    # For macOS, uncomment the following line:
    # brew install node
    
else
    echo "Node.js is already installed."
fi

# Install Pyright globally using npm (for Python LSP)
if ! command -v pyright &> /dev/null
then
    echo "Installing Pyright..."
    npm install -g pyright
else
    echo "Pyright is already installed."
fi

# Install Mason formatters (Black for Python, ClangFormat for C/C++, Stylua for Lua, Isort for Python)
echo "Setting up Mason formatters and tools..."

# Ensure Mason and formatters are installed using Neovim in headless mode
nvim --headless -c 'MasonInstall black clang-format stylua flake8 isort' -c 'qa'

# Add flake8 to the PATH by updating .bashrc if it's not already there
if ! command -v flake8 &> /dev/null
then
    echo "Adding Mason's flake8 to PATH..."
    echo 'export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"' >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
else
    echo "flake8 is already in PATH."
fi

echo "Neovim setup and Mason tools installation is complete!"

