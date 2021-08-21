#!/bin/bash
#
# After installing open neovim and run :PlugInstall
# CoC will report some errors but just press R to continue

sudo apt install neovim
ln -s $(pwd)/nvim ~/.config

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
