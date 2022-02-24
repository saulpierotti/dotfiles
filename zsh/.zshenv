# avoid nested ranger instances
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
	if [ -z "$@" ]; then
		ranger "$RANGER_START"
	else
		ranger $RANGER_PATH "$@"
	fi
    else
        exit
    fi
}

export PATH=$PATH:"/hps/software/users/birney/saul/n/versions/node/17.3.0/bin"

# text editor
export EDITOR="nvim"
export VISUAL="nvim"
export DIFFPROG="nvim -d"

# ranger
export RANGER_START="."

# needs to be sourced here otherwise spack completion is not defined at login
# and an error is raised
source $(brew --prefix)/share/antigen/antigen.zsh

# codon cluster specific
export N_PREFIX="/hps/software/users/birney/saul"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle esc/conda-zsh-completion
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle command-not-found

# Tell Antigen that you're done.
antigen apply
