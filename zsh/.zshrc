# codon cluster specific
fpath+=$HOME/.zsh/pure
module load singularity-3.7.0-gcc-9.3.0-dp5ffrp

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

# Load my aliases
source ~/.zsh_aliases

# history (copied from autoconfig)
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# vim mode
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# reverse search
bindkey '^R' history-incremental-search-backward

# Use ranger to switch directories and bind it to ctrl-o
bindkey -s '^o' 'source ranger_launcher.sh\n'

# pure theme
autoload -U promptinit compinit bashcompinit && promptinit && compinit && bashcompinit
prompt pure

# add snakemake completion
compdef _gnu_generic snakemake

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/hps/software/users/birney/saul/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/hps/software/users/birney/saul/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/hps/software/users/birney/saul/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/hps/software/users/birney/saul/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/hps/software/users/birney/saul/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/hps/software/users/birney/saul/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
