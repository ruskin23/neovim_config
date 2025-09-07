#!/bin/bash

# Neovim Configuration Installer
# This script installs all necessary dependencies for the Neovim configuration

set -e  # Exit on any error

echo "Starting Neovim configuration installation..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install package if not exists
install_package() {
    local package=$1
    local package_name=${2:-$1}
    
    if ! command_exists "$package"; then
        print_status "Installing $package_name..."
        sudo apt install -y "$package_name"
        print_success "$package_name installed successfully"
    else
        print_status "$package_name is already installed"
    fi
}

# Check if running on Ubuntu/Debian
if ! command_exists apt; then
    print_error "This script is designed for Ubuntu/Debian systems. Please install dependencies manually."
    exit 1
fi

# Update package list
print_status "Updating package list..."
sudo apt update

# Install Neovim
install_package "nvim" "neovim"

# Check Neovim version
NVIM_VERSION=$(nvim --version | head -n1 | cut -d' ' -f2)
print_status "Neovim version: $NVIM_VERSION"

# Ensure curl is available before Node install
install_package "curl" "curl"

# Install Node.js and npm (required for TypeScript LSP and other tools)
if ! command_exists node; then
    print_status "Installing Node.js and npm..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt install -y nodejs
    print_success "Node.js and npm installed successfully"
else
    print_status "Node.js is already installed"
fi

# Install Python and pip (required for Python LSP)
install_package "python3" "python3"
install_package "pip3" "python3-pip"

# Install Python development tools
install_package "python3-dev" "python3-dev"

# Install C/C++ development tools (required for clangd)
install_package "build-essential" "build-essential"
install_package "clang" "clang"

# Install ripgrep (required for Telescope live_grep)
install_package "rg" "ripgrep"

# Install git (required for gitsigns and general development)
install_package "git" "git"

# Install additional useful tools
install_package "curl" "curl"
install_package "wget" "wget"
install_package "unzip" "unzip"
install_package "rsync" "rsync"
install_package "fdfind" "fd-find"

# Install Lua development tools (optional but useful)
install_package "lua5.4" "lua5.4"
install_package "liblua5.4-dev" "liblua5.4-dev"

# Create Neovim config directory if it doesn't exist
CONFIG_DIR="$HOME/.config/nvim"
if [ ! -d "$CONFIG_DIR" ]; then
    print_status "Creating Neovim config directory..."
    mkdir -p "$CONFIG_DIR"
fi

# Copy configuration files if they don't exist
if [ ! -f "$CONFIG_DIR/init.lua" ]; then
    print_status "Copying configuration files..."
    rsync -a --exclude ".git" --exclude "install.sh" --exclude ".gitignore" ./ "$CONFIG_DIR/"
    print_success "Configuration files copied"
else
    print_warning "Neovim configuration already exists at $CONFIG_DIR"
    print_status "Skipping configuration file copy"
fi

# Install Lazy.nvim (plugin manager)
LAZY_PATH="$HOME/.local/share/nvim/lazy/lazy.nvim"
if [ ! -d "$LAZY_PATH" ]; then
    print_status "Installing Lazy.nvim plugin manager..."
    git clone --filter=blob:none --branch=stable https://github.com/folke/lazy.nvim.git "$LAZY_PATH"
    print_success "Lazy.nvim installed successfully"
else
    print_status "Lazy.nvim is already installed"
fi

# Add Mason bin directory to PATH if not already there
MASON_BIN="$HOME/.local/share/nvim/mason/bin"
if ! grep -q "$MASON_BIN" "$HOME/.bashrc" 2>/dev/null; then
    print_status "Adding Mason bin directory to PATH..."
    echo "" >> "$HOME/.bashrc"
    echo "# Neovim Mason tools" >> "$HOME/.bashrc"
    echo "export PATH=\"$MASON_BIN:\$PATH\"" >> "$HOME/.bashrc"
    print_success "Mason bin directory added to PATH"
else
    print_status "Mason bin directory already in PATH"
fi

# Source bashrc to update PATH for current session
export PATH="$MASON_BIN:$PATH"

# Add PATH for zsh
if [ -n "$ZSH_VERSION" ] || [ -f "$HOME/.zshrc" ]; then
    if ! grep -q "$MASON_BIN" "$HOME/.zshrc" 2>/dev/null; then
        {
            echo ""
            echo "# Neovim Mason tools"
            echo "export PATH=\"$MASON_BIN:\$PATH\""
        } >> "$HOME/.zshrc"
        print_success "Mason bin directory added to zsh PATH"
    else
        print_status "Mason bin directory already in zsh PATH"
    fi
fi

# Add PATH for fish
if command_exists fish; then
    if ! fish -c 'contains -- $HOME/.local/share/nvim/mason/bin $fish_user_paths' >/dev/null 2>&1; then
        fish -c 'set -U fish_user_paths $HOME/.local/share/nvim/mason/bin $fish_user_paths' || true
        print_success "Mason bin directory added to fish PATH"
    else
        print_status "Mason bin directory already in fish PATH"
    fi
fi

# Install Mason tools and LSP servers
print_status "Installing Mason tools and LSP servers..."
nvim --headless -c "MasonInstall lua-language-server pyright clangd typescript-language-server" -c "MasonInstall black clang-format stylua flake8 isort" -c "qa!"

# Install Treesitter parsers
print_status "Installing Treesitter parsers..."
nvim --headless +"TSUpdateSync lua python javascript html css c" +qa

# Verify installations
print_status "Verifying installations..."

# Check Neovim
if command_exists nvim; then
    print_success "Neovim: OK"
else
    print_error "Neovim: FAILED"
fi

# Check Node.js
if command_exists node; then
    print_success "Node.js: OK"
else
    print_error "Node.js: FAILED"
fi

# Check Python
if command_exists python3; then
    print_success "Python3: OK"
else
    print_error "Python3: FAILED"
fi

# Check ripgrep
if command_exists rg; then
    print_success "ripgrep: OK"
else
    print_error "ripgrep: FAILED"
fi

# Check git
if command_exists git; then
    print_success "git: OK"
else
    print_error "git: FAILED"
fi

# Check clang
if command_exists clang; then
    print_success "clang: OK"
else
    print_error "clang: FAILED"
fi

print_success "Installation completed successfully!"
echo ""
print_status "Next steps:"
echo "1. Restart your terminal or run: source ~/.bashrc"
echo "2. Start Neovim: nvim"
echo "3. Wait for plugins to install automatically"
echo "4. Install any missing LSP servers with: :Mason"
echo ""
print_status "Your Neovim configuration is ready to use!"

