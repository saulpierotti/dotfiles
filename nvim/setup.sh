#!/bin/bash
#
# After installing open neovim and run :PlugInstall
# If Coc gives errors is because you need to install node.js

brew install python
pip3 install --user pynvim # needed for some plugins
brew install neovim
brew install yarn # needed to auto-install coc extensions
ln -s $(pwd)/nvim ~/.config

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# NOTE: use kitty terminal for correct display of colours and Fira code for airline
