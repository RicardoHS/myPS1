#!/bin/sh

ln -sf $PWD/.vimrc ~/.vimrc
ln -sf $PWD/.zshrc ~/.zshrc
ln -sf $PWD/.env ~/.zshenv

mkdir -p ~/.config/nvim/
ln -sf $PWD/initrc.vim ~/.config/nvim/initrc.vim
ln -sf $PWD/init.lua ~/.config/nvim/init.lua

mkdir -p ~/.config/i3/
ln -sf $PWD/.config/i3/config ~/.config/i3/config

mkdir -p ~/.config/i3blocks/
ln -sf $PWD/.config/i3blocks/config ~/.config/i3blocks/config
