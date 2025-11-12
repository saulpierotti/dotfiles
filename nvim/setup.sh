#!/bin/bash
#
# After installing open neovim and run :PlugInstall
# If Coc gives errors is because you need to install node.js

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mv nvim-linux-x86_64.appimage ${HOME}/.local/bin/nvim

module load nodejs
npm config set prefix $HOME/.local
npm install -g neovim
/usr/bin/pip3.11 install --user pynvim # needed for some plugins

mkdir -p $HOME/.config/
ln -s $(pwd)/nvim/ ~/.config/

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
