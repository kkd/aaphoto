#!/bin/sh
# autogen.sh - Generate configure script and Makefiles

set -e

echo "Generating configure script and Makefiles..."

# Check if we're on macOS and using Homebrew
if [ "$(uname)" = "Darwin" ]; then
    echo "Detected macOS"
    
    # Check if Homebrew is available
    if command -v brew >/dev/null 2>&1; then
        echo "Homebrew detected, using Homebrew paths"
        export PKG_CONFIG_PATH="$(brew --prefix)/lib/pkgconfig:$PKG_CONFIG_PATH"
        export CPPFLAGS="-I$(brew --prefix)/include $CPPFLAGS"
        export LDFLAGS="-L$(brew --prefix)/lib $LDFLAGS"
    fi
fi

# Generate configure script
if [ -f configure.ac ]; then
    echo "Running autoconf..."
    autoconf
else
    echo "Error: configure.ac not found"
    exit 1
fi

# Generate Makefile.in files
if [ -f Makefile.am ]; then
    echo "Running automake..."
    automake --add-missing --copy
else
    echo "Error: Makefile.am not found"
    exit 1
fi

echo "Configuration files generated successfully!"
echo "You can now run: ./configure && make"
