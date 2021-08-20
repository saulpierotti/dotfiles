# Saul Archlinux Dotfiles

This folder contains some of my config files for ArchLinux on Acer Aspire 5.
The files in root/ are symlinked to the correct location in my system.
I am using this repo mainly as a backup and documentation of my configuration.
`fstab` does not work when symlinked so it must be copied and kept track of manually.
The folder installed_packages is an update list of ll the packages present on my system.

## How To Use

- My scripts are available on Github at `saulpierotti/.scripts`
- Use `to_dotfiles.sh filename` to copy a file to this repo and replace it with a symlink in the original location
- For consistency, I always symlink files and never folders
- The script `restore_dotfiles.sh` takes all the files in the folder and replaces the original file locations with symlinks to them
  - ATTENTION: this overwrites the files in the system

# TODO

- Random freezes with OBS and zoom, maybe because of the kernel? Now I am trying LTS

# Notes to Myself

## Bootloader

- I am using Grub2 with the `arch-silence-grub-theme-git` theme
- I use `grub-btrfs` to see also btrfs snapshots in the boot menu

### GRUB

- Kernel parameters are specified in `/etc/default/grub` at the line GRUB_CMDLINE_LINUX_DEFAULT (GRUB_CMDLINE_LINUX for parameters that are active also in recovery mode)
- After changing the file `/etc/default/grub` always run `grub-mkconfig -o /boot/grub/grub.cfg`

## Kernel

- I use linux-zen and I also installed its headers
- I removed the vanilla kernel to avoid 2 lengthy compilations at every package update
- I keep also the LTS kernel and its headers as a backup
- Kernel parameters are specified in `/etc/default/grub` (see GRUB section)
- I use the package `irqbalance` to balance loads across cores (I also enable the systemd service)
- I use the package `ananicy` to automatically renice processes (I also enable the systemd service)

## Swap

- I use a zram device, which is a compressed file on RAM
  - Load the zram kernel module by writing `zram` in `/etc/modules-load.d/zram.conf`
  - Set number of devices in `/etc/modules-load.d/zram.conf` by writing `options zram num_devices=2`
  - Create the udev rule `/etc/udev/rules.d/99-zram.rules` writing `KERNEL=="zram0", ATTR{disksize}="7G" RUN="/usr/bin/mkswap /dev/zram0", TAG+="systemd"`
  - Add the device to `/etc/fstab` writing `/dev/zram0 none swap defaults 0 0`

## GPU

- For managing the Nvidia and Intel GPUs, I am using Optimus Manager
  - Switching between GPUs and to hybrid mode works
  - In Nvidia mode TTY changes are not recommended and can result in freezes (but seems to work using the `xf86-video-intel` driver and setting intel mode instead of modesetting in optimus-manager-qt)
  - When resuming from a lock screen in nvidia or hybrid mode, the script Xorg post-start hook `/sbin/prime-offload` is not called
    - Call it manually when needed (`prime-offload`) or reload i3 (I put prime_offload_hack.sh as an `exec_always`)
    - It is needed when I see a really long string in conky
- For Nvidia I use the `nvidia-dkms` driver (since I am using the linux-zen kernel)
- CUDA works but my vRAM is limited (2Gb) so heavy things cannot be run with it

## Containers and virtualization

- I have both Docker and Singularity for container management
- Virtualbox for virtualization

### Virtualbox

- For Windows 10 I can use the host product key on the guest using the script `~/.scripts/virtualbox_windows_oem_transfer.sh <machine_name>`

### Docker

- In order to use GPU runtime I specified the kernel `parameter systemd.unified_cgroup_hierarchy=false` in `/etc/default/grub` at the line GRUB_CMDLINE_LINUX_DEFAULT
- I can run a GPU container just using the flag `--gpus all`, do not use nvidia-docker since it is deprecated
- GPU containers do not depend on host CUDA (!)

### Singularity

- Singularity is easier to use than Docker for data science since it has complete access to the host filesystem by default, it is similar to a virtualenv
- Singularity can run a proprietary container file and also docker containers
- GPU containers can be run but rely on the host CUDA toolkit
- The variable SINGULARITY_TMPDIR must be set ot a writeable directory when building containers
  - I export the variable in `.zshenv`

## Scientific software

- I use a combination of native packages, containers, virtual environments, anaconda

### Tensorflow

- It is really problematic to run it natively on GPU
- The easiest way is to use the GPU container with Docker or Singularity

## Dual monitor and resolution

- In general monitors and resolutions are managed by xrandr
- It is easier to use arandr to set the resolution correctly
  - When using directly xrandr sometimes strange sovrappositions happen
  - It is possible to save the arandr config as a simple xrandr script
- By default arandr saves configurations in `~/.screenlayout/`
  - I am keeping my configurations there
  - To set a configuration just execute the appropriate script in `~/.screenlayout/`
- The setting is not permanent after reboot
  - I am running a config script (from arandr) in the i3 config at startup

## Lock Screen and Screensaver

- I use xautolock to launch slock
  - xautolock is called from the i3 config file with the following parameters
  - `exec --no-startup-id xautolock -locker slock -time 10 -corners 0+0- -cornerdelay 1 -cornerredelay 60`
  - The top right corner triggers the lock after 1 second while the bottom right prevents the lock by placing the mouse in it
- Because of all of these problems with loght-locker I switched to slock and xautolock
  - As a screen-locker I am using light-locker, which just redirects to the LightDM login page
    - Light locker 1.9.0.3 has a bug that causes in a blank screen after unlock, reported in the Arch package page
    - 1.9.0.2 works fine, and thus I added light-locker to he list of packages ignored by pacman in `/etc/pacman.conf`
  - The locker is called when xset (part of xorg) activates the screensaver
    - The screensaver activation behavior is managed permanently in `/etc/X11/xorg.conf.d/10-monitor.conf`
    - I can inspect the current settings with `xset q`
  - I can invoke the lock manually by calling `light-locker-command -l`
  - The command light-locker is a background process that needs to be in execution for the lock to work
    - I execute it in the i3 config file
    - The execution parameters of the command can tweak the behavior of the lock (when to lock after the X screensaver is activated)
  - For some strange reason, the login after lock is done in TTY8, while LightDM is on TTY7
  - Given the problem for TTY switching with Nvidia, do not use the lock when in Nvidia mode
    - If the screen gets locked in nvidia mode: press space, then write the passwrd and press enter. The lockscreen is working even if the screen no
    - After unlocking like this once, then the screen lock works in nvidia mode until the next logout
  - Inhibition of the lockscreen is done with `exam_mode.sh` and inhibited with `exam_mode_undo.sh`
    - They just call xset and disable/enable blanking and screen poweroff

## Login Manager

- I am using LightDM
- If stuck in a login loop (password is accepted but then LighDM comes again)
  - Usually there is some error in .profile, .zshrc, .zshenv, or similar file read at login
  - If not, it can be a permission problem on such files
  - If not, it can be a permission problem on the folder /tmp

### LightDM

- I am using the webkit2 `lightdm-webkit-theme-litarvan` theme
- The user avatar and name (Saul Pierotti, not the user name) are better managed from the gnome settings panel (login to gnome!)
  - For some reason when I change the picture manually it does not work

## Window Manager

- I am using i3-gapps, and I keep gnome as a fallback
- In i3, I use polybar as a status bar
- Notifications are managed by twmnc
- The wallpaper is set by feh in `~/.xsession`
  - Note: it has to have executable permissions!

## File Browser

- I use ranger mostly, and nautilus occasionally when I need to do something that is easier graphiclly

### Ranger

- Ranger can be started from the command line or with its .desktop file
- When started from the command line, it heredits the environment of the user shell (.zshrc, .zsh_aliases, .zshenv)
- When called as a desktop application, it does not heredit the shell environment of the user
  - This can be a source of problems mainly for applications called by ranger that need conda
  - When opening a python script from ranger, this is opened in nvim, and since condainit is not sourced it is not possible to change conda environment from within vim
- For these conda problems, I use this setup
  - I created a custom desktop file in `.local/share/applications/ranger.desktop` which has precedence over the one in `/usr/share/applications`
  - This file does not execute ranger but it executes a script that I placed in `~/.scripts/ranger_visual_launcher.sh`
  - This script sources `~/.condainit` and then executes ranger on the folder `$RANGER_START` (which is set from `.zshenv`)
  - I do not source directly `~/.zshrc` since it cause lags when opening ranger (there are all the Oh-My-Zsh plugins)
  - Now it is possible to change conda environment from ranger launched as a desktop app in vim using `:CondaChangeEnv`

## Text Editor

- I use nvim

### Nvim

- I disabled the background color so to use the terminal background with `highlight Normal ctermbg=none`
  - This must be after the theme declaration to be effective
- I use the plugin `cjrh/vim-conda` for changing conda environments inside vim
  - This plugin requires condainit to be sourced in the shell that calls nvim
  - When calling vim from the command line this is not a problem
  - When opening vim from ranger (just opening a file) .zshrc is not sourced and so it does not work
    - This is a problem only if ranger is started as a desktop app and not from command line
    - To overcome this, I source condainit before opening ranger as a desktop app (see ranger section)
- I use the ALE plugin as a linter and fixer
  - Conda environments in ALE can be changed from within vim with vim-conda (`:CondaChangeEnv`)
  - I created the shortcut `ca` to change environment in that way and then call a script that configures the envirionment also for pyright (see Coc.nvim)
- I use Coc.nvim for autocompletion
  - Since I already use ALE for linting, I set up CoC to redirect linting messages to ALE in its config file (of Coc)
  - Coc can be configured at `.config/nvim/coc-settings.json`
  - Coc plugins are used for enabling intellinsense in different languages
  - Extensions can be installed with `:CocInstall`, but I prefer using Plug on my `init.nvim`
    - In order to install Coc extensions with Plug you need `yarn` (install with pacman)
    - Add the post-update hook as `Plug 'neoclide/coc-json', {'do': 'yarn install --forzen-lockfile'}`
    - Extensions installed with Plug cannt be removed with `:CocUnsinstall`
  - For python I use coc-pyright (Microsoft LSP)
    - It has problems with conda environments, and it does not see the env set by vim-conda
    - It does not also recognise configuration files in the root of the project folder
    - The only working way to set the path is to change `python.pythonPath` in the Coc configuration file
    - I change its envirionment using the shortcut `ca`, that first calls vim-conda (so to set the env for ALE)
      - After setting an env with vim-conda, it calls a script that overwrites the Coc config file
      - It sets `python.pythonPath` to what is selected by vim-conda
  - In general I am disabling the linting features of Coc since I prefer ALE for that
- I use `puremourning/vimspector` for debugging
- It is better to avoid using vim within a conda environment for problems with vim-conda and Coc.nvim

## Terminal

- I use kitty since it supports fonts with ligatures (I use Fira Code) and it is GPU-accellerated

### Kitty

- I did not set zsh autocompletion for kitty in `.zshrc` since I am using zsh-completions with antigen
- Since the `$TERM` definition `xterm-kitty` is not common, in ssh often you get a prompt without color
  - To overcome this, I aliased `ssh` to `TERM='xterm-256color' ssh $@` in `~/.zsh_aliases`

## Console

- I use zsh and leave bash and its basic config files for compatibility

### zsh

- I use antigen as a plugin manager
- I use the oh-my-zsh plugin library

## Connectivity

- I use network-manager, managed mostly via the nm-applet
- I implemented a WiFi hotspot with network-manager and dnsmasq
  - For connection sharing, netowrk manager requires the optional dependency `dnsmasq`
  - I created a fake WiFi network from network manager using WPA2 encription and a key longer than 8 charachters
  - The mode of the network must be set to Hotspot
  - To activate the hotspot, just connect to the network (connect to hidden network and select hotspot, or from command line)
- I set `dnsmasq` as the default dns method for NetworkManager in `/etc/NetwrokManager/conf.d/00-use-dnsmasq.conf`
- For the biocomp VPN to work, you have to go to the IPV4 tab in the VPN page of `nm-connection-editor`, go to Routes and select "Use this connection only for resources in this network"

## Media

### Media player

- I use mpv for videos with some configuration to improve quality at a performance cost (in `~/.config/mpv/mpv.conf`)

### Video recording

- I use OBS for video recording, but sometimes it crashes the PC unexpectedly
- I can use the incorporated webcam without specific configures
- Cheese (simple gnome video recorder) does not open correctly

### Video conference

- Most institution use zoom, so it is a must have
  - I installed it as a flatpak, no problems so far
  - AUR version can cause problems
- Because of my university, I use Microsoft Teams
  - I use also for this the flatpak

### PDF presentation

- I use pympress for my beamer presentations
- To use with zoom share the pympress content window maximized in a second screen (or a virtual screen)

### Screen sharing/recording

- Sharing and recording are equivalent so here I will always talk about recording
- Xorg does not render what is not on the current desktop, so it not possible to use the PC while recording something
- I created a virtual desktop where I can place what I want to record so it is rendered even though it is not shown
  - I use xrandr for this
  - Just call the script `~/.screenlayout/virtual_screen_attached.sh` and then reload i3

### Using Android phone as a virtual camera

- I use Droidcam for this task
  - I bought the pro version for HD resolution since I really liked it
- To use HD, change the resolution in `/etc/modprobe.d/droidcam.conf` to 1920x1080 (1080p) and set video quality to high in the app
- It must be installed on the phone and on PC (from AUR)
- It works both with WiFi or USB
- USB is more stable and what I usually use
- WiFi works out of the box
  - Since I am using a custom kernel, I need the video loopback dkms `v4l2loopback-dkms`
  - Reboot after installing!
- USB requires USB debugging enabled on the phone and on the PC `android-tools` and `android-udev` installed
  - Enable also debugging security settings for the first connection, then you can disable it
- Reboot!
- Check that the phone is seen by running `adb devices`
  - It should show `device` and not `unauthorized`
- Add `options snd-aloop index=0` to `/etc/modprobe.d/droidcam.conf`
- For the audio, it is needed to configure the alsa loopback device
  - Add this to `~/.config/pulse/default.pa`

```
load-module module-alsa-source device=hw:Loopback,1,0
update-source-proplist alsa_input.hw_Loopback_1_0  device.description="Droidcam"
```

- Restart pulseaudio with `pulseaudio -k`
- Audio is heavily distorted and I decided not to use it
- I removed the modifications to pulseaudio configs
- Everything works only while the Droidcam app is running both on the phone and PC

## NordVPN

- Do not sync the config file since it contains an access token

## Tex

- I installed the texlive-most meta package
- I edit in vim using the plugin vimtex, and ALE for linting
- ALE uses latexindent, which is included in texlive-most, but misses the perl module `perl-log-dispatch` (in the AUR)
- I use coc-texlab for completion

### Zathura forward and backward synctex

- This functionality allows to jump easily from pdf and tex code when reading
- I use vimtex on the nvim side and zathura is configured with the line `set synctex true` and `set synctex-editor-command "nvr --remote-silent +%{line} %{input}"` in `.config/zathura/zathurarc`
- To go to the source from zathura just Ctr + click on a word
- To jump to the pdf from nvim use :VimtexView or `<leader>f`

## Desktop widget

- I use conky, configured in `./config/conky/conky.conf`
- When changing screen resolution or disposition the placement of the widget can be messed up
  - I have a killall command in the i3 config followed by a call to conky, executed at each reload of i3

## Coding

- I use jupyter lab for prototyping and vim for my production environment
- I use heavily pip for creating virtual environments

### Jupyter

#### Virtual environments

- I use the jupyter installation that exists in --user
- In order to add a kernel from a virtualenv, first activate the virtualenv and then run

```
ipython kernel install --name "name to show" --user
```

- Now the kernel is visible from the jupyter launched without any virtualenv

#### Remote runtime

- Sometimes it is useful to interact on my browser with a jupyter notebook that is on a server
- I forward the remote port 9999 to the local one with the command
  - There is nothing special about 9999, it is just an unused port
  - `9999:localhost:8888` forwards the remote 8888 to the local 9999
  - I am using the remote 9999 and not the jupyter default 8888 since in this way I can just copy-paste the address given by jupyter to my browser, without overwriting the local jupyter port 8888

```
ssh -L 9999:localhost:9999 -N <user@host>

```

- I start the notebook on the remote server under ssh using

```
ssh <user@host>
jupyter lab --no-browser --port=9999
```

- I then open on my local browser the link given by the remote jupyter lab output
- To automate the process I wrote a script that opens the tunnel and launches the remote command

```
tunnel_jupyterlab.sh <user@host> <<port>>
```

#### Jupyterlab extensions

- Extensions are installed with `jupyter labextension install <ext_name>`

##### Code formatting

- I use `@ryantam626/jupyterlab_code_formatter`, which uses an underlying installation of black or other formatters
- It provides a "Format cell" entry in the right click menu for a cell
- Installation (restart jupyterlab afterwards):

```
pip install jupyterlab_code_formatter
jupyter labextension install @ryantam626/jupyterlab_code_formatter
pip install black isort
jupyter server extension enable --py jupyterlab_code_formatter --user
```
