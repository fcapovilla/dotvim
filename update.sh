#!/bin/sh

git submodule foreach git pull origin master

# Compile vimproc
cd bundle/vimproc.vim
make
