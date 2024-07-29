#!/bin/bash

# Function to check if Wine is installed
check_wine_installed() {
    if ! command -v wine &> /dev/null
    then
        echo "Wine is not installed. Installing Wine..."
        sudo dpkg --add-architecture i386
        sudo apt update
        sudo apt install -y wine64 wine32
    else
        echo "Wine is already installed."
    fi
}

# Function to run a Windows application
run_windows_app() {
    read -p "Enter the path to the Windows executable (.exe) file: " exe_path
    if [ -f "$exe_path" ]; then
        wine "$exe_path"
    else
        echo "File not found: $exe_path"
    fi
}

# Main script
echo "Checking for Wine installation..."
check_wine_installed

echo "Welcome! This script will allow you to run Windows applications on Linux."
run_windows_app
