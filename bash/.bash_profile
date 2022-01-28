# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
PATH=$PATH:/hps/software/users/birney/saul/source_installs/bin
PATH=$PATH:$HOME/.linuxbrew/bin
PATH=$PATH:$HOME/.scripts
PYTHONPATH=$PYTHONPATH:/hps/software/users/birney/saul/source_installs/bin

export PATH
export PYTHONPATH

# since I do not have sudo rights I need to change the shell like this
export SHELL=/bin/zsh
exec /bin/zsh -l
