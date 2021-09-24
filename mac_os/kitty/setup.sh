#!/bin/bash
#
# It is impossible to change the default terminal in Pop!_OS
# To open specific applications with kitty change the relative entries
# in /usr/share/applications.
# Use Exec=kitty -e command and set terminal to false.

brew install kitty
ln -s $(pwd)/kitty ~/.config
