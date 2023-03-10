#!/bin/bash

sudo apt install zsh
chsh -s /usr/bin/zsh
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
curl -L git.io/antigen > antigen.zsh
ln -s $(pwd)/.zshrc ~
ln -s $(pwd)/.zshenv ~
ln -s $(pwd)/.zsh_aliases ~
