# workaround since I cannot set the shell with chsh
shopt -q login_shell && [[ $- == *i* ]] && exec /bin/zsh -l
