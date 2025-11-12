# needed here to avoid zsh complaining about ncurses
source ${HOME}/.module_load

# workaround since I cannot set the shell with chsh
shopt -q login_shell && [[ $- == *i* ]] && exec ${HOME}/.local/bin/zsh -l
