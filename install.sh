#!/bin/bash

# This script makes symbolic links to apply the config to the user's home
# Any change made locally will be reflected on the repo, allowing a remote update if you choose to push


### ZSH
# TODO: specify custom folder config if omz, else add an autoloader
echo "Setting up ZSH config"
ln -sf "$PWD/zshrc" "$HOME/.config"


### NVIM
# echo "Setting up nvim config"
# ln -sf "$PWD/nvim" "$HOME/.config"
