#!/bin/bash

xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
Brew install antigen
brew install zsh-async
brew install pure
ln -s $(pwd -P)/.zshrc ~
ln -s $(pwd -P)/.zshenv ~
ln -s $(pwd -P)/.zsh_aliases ~
