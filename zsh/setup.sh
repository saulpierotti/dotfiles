##!/bin/bash

brew install antigen
brew install zsh-async
brew install pure
ln -s $(pwd -P)/.zshrc ~
ln -s $(pwd -P)/.zshenv ~
ln -s $(pwd -P)/.zsh_aliases ~
