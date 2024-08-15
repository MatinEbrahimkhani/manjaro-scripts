#!/bin/bash

# Update the system and install required dependencies
echo "Updating system and installing dependencies..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm base-devel git cmake qt5-base

# Clone the Nekoray repository
echo "Cloning the Nekoray repository..."
git clone https://github.com/MatsuriDayo/nekoray.git

# Navigate to the cloned directory
cd nekoray || { echo "Failed to enter nekoray directory"; exit 1; }

# Create build directory and compile the source code
echo "Building Nekoray from source..."
mkdir build && cd build || { echo "Failed to create or enter build directory"; exit 1; }
cmake ..
make

# Install Nekoray
echo "Installing Nekoray..."
sudo make install

# (Optional) Create a desktop entry for Nekoray
echo "Creating a desktop entry for Nekoray..."
cat <<EOL > ~/.local/share/applications/nekoray.desktop
[Desktop Entry]
Name=Nekoray
Exec=nekoray
Icon=
Type=Application
Categories=Network;
EOL

# Notify the user that the installation is complete
echo "Nekoray installation complete! You can now find Nekoray in your application menu or run it using 'nekoray'."
