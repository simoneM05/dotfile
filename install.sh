#!/bin/bash

set -e  # Interrompe lo script in caso di errore

# Aggiorna i pacchetti e installa dipendenze
sudo apt update && sudo apt upgrade -y

# Installa Zsh
if ! command -v zsh &> /dev/null; then
    echo "Installing Zsh..."
    sudo apt install -y zsh
else
    echo "Zsh is already installed."
fi

# Installa Snap
if ! command -v snap &> /dev/null; then
    echo "Installing Snap..."
    sudo apt install -y snapd
else
    echo "Snap is already installed."
fi

# Installa Node.js e Yarn
if ! command -v node &> /dev/null; then
    echo "Installing Node.js..."
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt install -y nodejs
    corepack enable
    echo "Node.js and Yarn installed."
else
    echo "Node.js is already installed."
fi

# Installa Docker solo se non è WSL 2
if grep -qi "microsoft" /proc/version && [ -d "/mnt/c/" ]; then
    echo "Skipping Docker installation because WSL 2 is detected. Enable WSL integration in Docker Desktop."
else
    if ! command -v docker &> /dev/null; then
        echo "Installing Docker..."
        sudo apt install -y docker.io
        sudo systemctl enable --now docker
        sudo usermod -aG docker $USER
        echo "Docker installed. Please log out and back in for group changes to take effect."
    else
        echo "Docker is already installed."
    fi
fi

# Installa Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed."
fi

# Installa lsd
if ! command -v lsd &> /dev/null; then
    echo "Installing lsd..."
    sudo apt install -y lsd
else
    echo "lsd is already installed."
fi

# Installa zsh-autosuggestions
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
else
    echo "zsh-autosuggestions is already installed."
fi
