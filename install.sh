#!/bin/bash

# Set the directory where Neovim config will be copied
CONFIG_DIR="$HOME/.config/nvim"

# Clone your Neovim configuration from GitHub (replace <your-repo-url> with your actual repo URL)
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Creating Neovim config directory at $CONFIG_DIR"
    mkdir -p "$CONFIG_DIR"
fi

# Clone the repository (if it's not already cloned)
if [ ! -d "$CONFIG_DIR/.git" ]; then
    echo "Cloning Neovim configuration from repository..."
    git clone <your-repo-url> "$CONFIG_DIR"
else
    echo "Neovim config already exists, pulling latest changes..."
    cd "$CONFIG_DIR"
    git pull
fi

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

# Install Node.js and npm if not installed (required for Pyright)
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

# Install Pyright globally using npm
if ! command -v pyright &> /dev/null
then
    echo "Installing Pyright..."
    npm install -g pyright
else
    echo "Pyright is already installed."
fi

# Install Mason formatters (Black for Python, ClangFormat for C/C++)
echo "Setting up Mason formatters..."

# Ensure Mason and formatters are installed using Neovim in headless mode
nvim --headless -c 'MasonInstall black clang-format stylua' -c 'qa'

echo "Neovim setup is complete!"

