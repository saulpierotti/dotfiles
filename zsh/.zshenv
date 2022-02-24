# avoid nested ranger instances
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
	if [ -z "$@" ]; then
		/usr/local/bin/ranger "$RANGER_START"
	else
		/usr/local/bin/ranger "$@"
	fi
    else
        exit
    fi
}

# set default terminal
export TERMINAL="kitty"
export TERM="xterm-256color"

# text editor
export EDITOR="nvim"
export VISUAL="nvim"
export DIFFPROG="nvim -d"

# for --user pip packages
export PATH="${PATH}:/Users/saul/.local/bin"
export PATH="${PATH}:/Users/saul/Library/Python/3.9/bin"
export PYTHONPATH="${PYTHONPATH}:/Users/saul/.local/lib"

# for conda brew cask
export PATH="${PATH}:/usr/local/anaconda3/bin"

# my custom scripts
export PATH="${PATH}:/Users/saul/.scripts"
export PATH="${PATH}:/Users/saul/.bioscripts/python"
export PATH="${PATH}:/Users/saul/.bioscripts/bash"

# modeller
export KEY_MODELLER="MODELIRANJE"

# ranger
export RANGER_START="."
