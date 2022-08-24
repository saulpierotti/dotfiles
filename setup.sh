# install packages
apk add openssh # for git ssh
apk add git

# clone my repos
git clone https://github.com/saulpierotti/scripts.git
mv scripts .scripts

# symlinks for dotfiles
ln -s $HOME/.profile $HOME
