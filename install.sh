#!/bin/bash

# This script makes symbolic links to apply the config to the user's home
# Any change made locally will be reflected on the repo, allowing a remote update if you choose to push


###
echo "Setting up nvim config"
ln -s "$PWD/nvim" "$HOME/.config"
