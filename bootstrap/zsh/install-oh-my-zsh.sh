#!/usr/bin/env bash

echo "TODO: ensure zsh is installed"

# Ensure zsh is installed
if [[ -z $(which zsh) ]]; then
  sudo apt-get install zsh
fi

# Clear stale configs
rm ~/.zshrc

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
