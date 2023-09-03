export SHELL="/bin/zsh"

export PATH=$PATH:"/hps/software/users/birney/saul/n/versions/node/17.3.0/bin"
export PATH=$PATH:"/hps/software/users/birney/saul/scripts"
export PATH=$PATH:"/hps/software/users/birney/saul/bin"

# text editor
export EDITOR="nvim"
export VISUAL="nvim"
export DIFFPROG="nvim -d"

# ranger
export RANGER_START="."

# needs to be sourced here otherwise spack completion is not defined at login
# and an error is raised
source /hps/software/users/birney/saul/bin/antigen.zsh
# needs to be done here otherwise spack completion is not defined at login
# and an error is raised
autoload -U bashcompinit
autoload -Uz compinit
bashcompinit
compinit

# codon cluster specific
export N_PREFIX="/hps/software/users/birney/saul"

# nextflow tower token
export TOWER_ACCESS_TOKEN=$(cat ~/.nextflow/nextflow_tower_token)

if [[ `uname` == Darwin ]]; then
    MAX_MEMORY_UNITS=KB
else
    MAX_MEMORY_UNITS=MB
fi

# fancy time command
export TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M '$MAX_MEMORY_UNITS''$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'
