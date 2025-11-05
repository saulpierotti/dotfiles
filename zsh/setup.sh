##!/bin/bash
curl -L git.io/antigen > ~/.antigen.zsh
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
ln -s $(pwd -P)/.zshrc ~
ln -s $(pwd -P)/.zshenv ~
ln -s $(pwd -P)/.zsh_aliases ~
ln -s $(pwd -P)/.module_load ~
ln -s $(pwd -P)/.bash_profile ~
