#!/bin/sh

ln -sf $PWD/.vimrc ~/.vimrc
ln -sf $PWD/.zshrc ~/.zshrc

mkdir -p ~/.config/nvim/
ln -sf $PWD/init.vim ~/.config/nvim/init.vim

