#!/bin/bash

# This script makes symbolic links to apply the config to the user's home
# Any change made locally will be reflected on the repo, allowing a remote update if you choose to push


### BASH
echo "Setting up BASH config"
ln -sf "$PWD/.bashrc" "$HOME"
ln -sf "$PWD/bashrc" "$HOME/.config"
source "$HOME/.bashrc"

### NVIM
echo "Setting up nvim config"
ln -sf "$PWD/nvim" "$HOME/.config"
