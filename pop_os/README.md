# Saul Pop!_OS Dotfiles

This folder contains some of my config files for Pop!_OS on Acer Aspire 5.
Arch has been a great system for learning how to use linux but now I just need something that works out of the box with minimal effort.
Pop!_OS has a great polished interface, out-of-the-box support for disk encryption, and it is in general good for data science.
Nvidia is also supported.
I want to make a system as simple as possible.
I keep a subfolder for each application for which I want to store a configuration.
For each application, a setup.sh script contains the setup actions required for configuring it.

## Encryption
It is possible to set up full disk encryption using the graphical installer.
The swap partition is also encrypted.

## Recovery
The default configuration creates also a recovery partition containing a copy of the live CD

## Background
Can be changed from the image viewer (eog).

## Lock screen
Cannot be changed. It is a blurred version of the wallpaper.
Gnome-tweaks does not work.

## Cursor
Download the cursor tarball, unpack it, and place it in `/usr/share/icons`.
Set the cursor with Gnome tweaks.

## Virtualization
Gnome boxes with windows. No need for backups, installation when needed.
