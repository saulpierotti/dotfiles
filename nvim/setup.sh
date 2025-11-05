#!/bin/bash
#
# After installing open neovim and run :PlugInstall
# If Coc gives errors is because you need to install node.js

git clone https://github.com/neovim/neovim /tmp/neovim
cd /tmp/neovim
module load system/gcc
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local" CMAKE_BUILD_TYPE=RelWithDebInfo
make install
npm config set prefix $HOME/.local
npm install -g neovim
/usr/bin/pip3 install --user pynvim # needed for some plugins

mkdir -p $HOME/.config/
ln -s $(pwd)/nvim/ ~/.config/

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/mastera/plug.vim'
