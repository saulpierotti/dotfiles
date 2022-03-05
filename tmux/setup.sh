#!/bin/bash

sudo apt install tmux
ln -s $(pwd -P)/.tmux.conf ~
ln -s $(pwd -P)/.tmux.conf.local ~
