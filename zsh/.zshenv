export SHELL="${HOME}/.local/bin/zsh"
export PATH=$PATH:"${HOME}/.scripts"
export PATH=$PATH:"${HOME}/.local/bin"

export LD_LIBRARY_PATH="${HOME}/local/lib"

# text editor
export EDITOR="nvim"
export VISUAL="nvim"
export DIFFPROG="nvim -d"

# fancy time command
export TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M '$MAX_MEMORY_UNITS''$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

source ${HOME}/.module_load
