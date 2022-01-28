# Termux Dotfiles
Termux is a terminal emulator for Android. See <https://termux.com/>.
This repository contains the configuration files that I use to recreate an environment which is similar to the one that I have on my Linux installation.
To use this repository, there is no need to manually clone it: just run the script `setup.sh` on an existing termux installation. It will take care of everything.
Change the usernames hardcoded in the `setup.sh` script as appropriate!

One-liner for installing everything (run on a Termux installation!):
```
curl -s https://raw.githubusercontent.com/saulpierotti/termux_dotfiles/main/setup.sh|sh
```

After running the setup script configure ssh access to GitHub (modify as appropriate for different usernames):

```
git config --global user.email "email@example.com"
git config --global user.name "Saul Pierotti Termux"
ssh-keygen -t ed25519 -C "email@example.com"
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/id_ed25519
cat $HOME/.ssh/id_ed25519.pub
```

Upload now the ssh public key (output of the last command) to GitHub and test that it is recognised with:

```
ssh -T git@github.com
```

Install the vim packages with [vim-plug][vp]. First open nvim:

[vp]: <https://github.com/junegunn/vim-plug>

```
nvim
```

Then from nvim run:

```
:PlugInstall
```

After this CocNvim will complain: just press `R`.
Close the current shell and open a new one for using zsh.
