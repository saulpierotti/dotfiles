#!/bin/bash

xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install zsh
Brew install antigen
brew install zsh-async
brew install pure-prompt
ln -s $(pwd)/.zshrc ~/
ln -s $(pwd)/.zshenv ~/
ln -s $(pwd)/.zsh_aliases ~/
