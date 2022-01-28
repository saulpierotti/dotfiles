# Load antigen (Ubuntu installation)
source /usr/local/share/antigen/antigen.zsh

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
bindkey -s '^[^o' 'source ranger_launcher_sudo.sh\n'

# pure theme
autoload -U promptinit; promptinit
prompt pure

export VISUAL=nvim;
export EDITOR=nvim;

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/saul/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/saul/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/Users/saul/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/Users/saul/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/saul/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/Users/saul/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

