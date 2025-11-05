# Load antigen (Ubuntu installation)
source /usr/share/zsh-antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
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

# open nautilus in working dir
bindkey -s '^f' 'nautilus .&; disown\n'

# disable git plugins in the sshfs mount folder for performance reasons
zstyle ':vcs_info:*' disable-patterns "$HOME/sshfs_mountpoint(|/*)"

# pure theme
autoload -U promptinit; promptinit
prompt pure

PATH="/home/spierotti/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/spierotti/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/spierotti/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/spierotti/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/spierotti/perl5"; export PERL_MM_OPT;

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
export MAMBA_EXE='/home/spierotti/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/spierotti/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
