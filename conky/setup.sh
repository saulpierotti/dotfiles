#!/bin/bash

sudo apt install conky-all # conky-all has support for nvidia
sudo apt install lm-sensors vnstat
ln -s $(pwd)/conky ~/.config
