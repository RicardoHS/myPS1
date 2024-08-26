#!/bin/sh

ln -sf $PWD/.vimrc ~/.vimrc
ln -sf $PWD/.zshrc ~/.zshrc
ln -sf $PWD/.env ~/.zshenv

mkdir -p ~/.config/nvim/
ln -sf $PWD/initrc.vim ~/.config/nvim/initrc.vim
ln -sf $PWD/init.lua ~/.config/nvim/init.lua

