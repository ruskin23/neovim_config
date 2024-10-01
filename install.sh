#!/bin/bash

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

# Clone your Neovim configuration from GitHub (replace <your-repo-url> with your actual repo URL)
CONFIG_DIR="$HOME/.config/nvim"

if [ ! -d "$CONFIG_DIR" ]; then
    echo "Creating Neovim config directory at $CONFIG_DIR"
    mkdir -p "$CONFIG_DIR"
fi

if [ ! -d "$CONFIG_DIR/.git" ]; then
    echo "Cloning Neovim configuration from repository..."
    git clone <your-repo-url> "$CONFIG_DIR"
else
    echo "Neovim config already exists, pulling latest changes..."
    cd "$CONFIG_DIR"
    git pull
fi

echo "Neovim setup is complete!"

