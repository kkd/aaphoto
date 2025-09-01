# aaphoto - Homebrew Support Version

## Overview
Auto Adjust Photo is a command-line tool for automatic color correction of images. It supports macOS Homebrew.

## Installation with Homebrew

### 1. Install Dependencies
```bash
brew install autoconf automake libtool pkg-config
brew install libjpeg-turbo libpng zlib
brew install gcc
```

### 2. Build from Source
```bash
# Clone the repository
git clone git@github.com:kkd/aaphoto.git
cd aaphoto

# Generate configuration files
./autogen.sh

# Build and install
./configure
make
make install
```

### 3. Install as Homebrew Formula
```bash
# Install as local formula
brew install --build-from-source Formula/aaphoto.rb
```

## Usage
```bash
# Basic usage
aaphoto image.jpg

# Auto adjust and resize
aaphoto -a -r600 -q85 *.jpg

# Process all images in directory
aaphoto mydir

# Resize with verbose output
aaphoto -V --resize70% image.png
```

## Supported Image Formats
- JPEG (.jpg, .jpeg)
- PNG (.png)
- BMP (.bmp)

## Main Features
- Automatic color correction
- Image resizing
- Rotation and flipping
- Quality adjustment
- Multi-threading (OpenMP)

## Troubleshooting

### Library Not Found
```bash
# Check pkg-config paths
pkg-config --list-all | grep -E "(jpeg|png|zlib)"

# Check Homebrew paths
brew --prefix
```

### OpenMP Errors
```bash
# Check GCC version
gcc --version

# Check OpenMP support
gcc -fopenmp -dM -E - < /dev/null | grep -i openmp
```

## License
GNU General Public License v3.0 or later

## Author
Andras Horvath (mail@log69.com)
