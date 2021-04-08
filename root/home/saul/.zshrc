# Antigen (plugin manager)-----------------------------------------
source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# plugins
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle autojump
antigen bundle zsh-users/zsh-completions
antigen bundle esc/conda-zsh-completion 
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle command-not-found

# Tell Antigen that you're done.
antigen apply

# enable conda
source /home/saul/.condainit

# Load my aliases
source /home/saul/.zsh_aliases

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

# open nautilus in working dir
bindkey -s '^f' 'nautilus .&; disown\n'

# disable git plugins in the sshfs mount folder for performance reasons
zstyle ':vcs_info:*' disable-patterns "$HOME/sshfs_mountpoint(|/*)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/saul/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/saul/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/saul/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/saul/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

