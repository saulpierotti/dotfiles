#!/bin/bash

brew install tmux
ln -s $(pwd -P)/.tmux.conf ~
ln -s $(pwd -P)/.tmux.conf.local ~
