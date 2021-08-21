#!/bin/bash

sudo apt install zsh
sudo apt install zsh-antigen
sudo apt install npm
sudo npm install --global pure-prompt
ln -s $(pwd)/.zshrc ~/
ln -s $(pwd)/.zshenv ~/
ln -s $(pwd)/.zsh_aliases ~/
