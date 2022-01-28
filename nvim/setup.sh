#!/bin/bash
#
# After installing open neovim and run :PlugInstall
# CoC will report some errors if node.js is not installed

sudo apt install neovim
sudo apt install yarn # needed to auto-install coc extensions
ln -s $(pwd)/nvim ~/.config

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
