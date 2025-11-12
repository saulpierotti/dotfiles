#!/bin/bash

# zsh
ZSH_VER=5.9
wget https://www.zsh.org/pub/zsh-${ZSH_VER}.tar.xz
tar -xf zsh-${ZSH_VER}.tar.xz
module load ncurses gcc
cd zsh-${ZSH_VER}
./configure --prefix=${HOME}/.local
make
make check
make install

# configs
cd ..
ln -s $(pwd -P)/.zshrc ~
ln -s $(pwd -P)/.zshenv ~
ln -s $(pwd -P)/.zsh_aliases ~
ln -s $(pwd -P)/.module_load ~
ln -s $(pwd -P)/.bash_profile ~

# antigen etc
curl -L git.io/antigen > ~/.antigen.zsh
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

