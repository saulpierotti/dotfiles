# install packages
apk update
apk upgrade
apk add bash
apk add openssh # for git ssh
apk add git

# clone my repos
git clone https://github.com/saulpierotti/scripts.git
mv scripts $HOME/.scripts

# symlinks for dotfiles
ln -sf $HOME/.profile $HOME
