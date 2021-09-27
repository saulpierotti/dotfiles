# install packages
pkg install -y zsh
pkg install -y openssh # for git ssh
pkg install -y git
pkg install -y python # includes pip
pkg install -y ranger
pkg install -y neovim
pkg install -y nodejs # needed for CocNvim
pkg install -y gnupg

termux-setup-storage

# my own repos
git clone https://github.com/saulpierotti/termux_dotfiles.git
git clone https://github.com/saulpierotti/scripts.git
mv scripts .scripts

# symlinks for dotfiles
ln -s $HOME/termux_dotfiles/.zshrc $HOME
ln -s $HOME/termux_dotfiles/.zshenv $HOME
ln -s $HOME/termux_dotfiles/.zsh_aliases $HOME
mkdir -p $HOME/.config/nvim
ln -s $HOME/termux_dotfiles/init.vim $HOME/.config/nvim/init.vim

# install antigen
mkdir -p .zsh
curl -L git.io/antigen > $HOME/.zsh/antigen.zsh
source $HOME/.zsh/antigen.zsh

# install pure theme for zsh
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
       
# install powerline fonts for vim
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
rm -rf fonts

# change the default shell
chsh -s zsh
