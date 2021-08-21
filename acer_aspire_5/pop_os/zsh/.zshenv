# avoid nested ranger instances
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
	if [ -z "$@" ]; then
		/usr/bin/ranger "$RANGER_START"
	else
		/usr/bin/ranger "$@"
	fi
    else
        exit
    fi
}

# theme dark, breakes firefox
# set theme with gnome-tweaks, not here
#export GTK2_RC_FILES="/usr/share/themes/Adapta-Nokto"
#export GTK_THEME="Adapta-Nokto"

# set default terminal
export TERMINAL="kitty"
export TERM="xterm-kitty"

# text editor
export EDITOR="nvim"
export VISUAL="nvim"
export DIFFPROG="nvim -d"

# for --user pip packages
export PATH="${PATH}:/home/saul/.local/bin"
export PYTHONPATH="${PYTHONPATH}:/home/saul/.local/lib"

# temporary, for my msc thesis
export PYTHONPATH="${PYTHONPATH}:/home/saul/master_thesis_work/source/models"
export DMS_REPOSITORY_ROOT="/home/saul/master_thesis_work"

# my custom scripts
export PATH="${PATH}:/home/saul/.scripts"
export PATH="${PATH}:/home/saul/.bioscripts/python"
export PATH="${PATH}:/home/saul/.bioscripts/bash"

# t_coffee
export EMAIL_4_TCOFFEE="saulpierotti@gmail.com"

# modeller
export KEY_MODELLER="MODELIRANJE"

# ranger
export RANGER_START="/home/saul/Desktop"

# for singularity to allow builds (cannot write to /tmp)
export SINGULARITY_TMPDIR='/home/saul/.singularity_tmpdir'
