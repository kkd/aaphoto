#!/bin/bash
# install_homebrew.sh - Installation script for aaphoto in Homebrew environment

set -e

echo "=== aaphoto Homebrew Support Version Installation Script ==="

# Check if running on macOS
if [ "$(uname)" != "Darwin" ]; then
    echo "Error: This script is for macOS only"
    exit 1
fi

# Check if Homebrew is installed
if ! command -v brew >/dev/null 2>&1; then
    echo "Error: Homebrew is not installed"
    echo "Please install Homebrew: https://brew.sh/"
    exit 1
fi

echo "Homebrew detected: $(brew --prefix)"

# Install dependencies
echo "Installing dependencies..."
brew bundle --file=Brewfile

# Run autogen.sh
echo "Generating configuration files..."
./autogen.sh

# Run configure
echo "Running configure..."
./configure

# Build
echo "Building..."
make

# Install (optional)
read -p "Install to system? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing..."
    sudo make install
    echo "Installation complete!"
else
    echo "Build complete! Executable is in current directory"
fi

echo "=== Installation Complete ==="
echo "Usage: ./aaphoto --help"
