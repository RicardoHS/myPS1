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

mkdir -p ~/.config/sway/
ln -sf $PWD/.config/sway/config ~/.config/sway/config

# Hyprland (UserConfigs override pattern for JaKooLit dotfiles)
mkdir -p ~/.config/hypr/UserConfigs/
ln -sf $PWD/.config/hypr/monitors.conf ~/.config/hypr/monitors.conf
ln -sf $PWD/.config/hypr/workspaces.conf ~/.config/hypr/workspaces.conf
ln -sf $PWD/.config/hypr/hypridle.conf ~/.config/hypr/hypridle.conf
ln -sf $PWD/.config/hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf
ln -sf $PWD/.config/hypr/UserConfigs/UserSettings.conf ~/.config/hypr/UserConfigs/UserSettings.conf
ln -sf $PWD/.config/hypr/UserConfigs/UserKeybinds.conf ~/.config/hypr/UserConfigs/UserKeybinds.conf
ln -sf $PWD/.config/hypr/UserConfigs/UserAnimations.conf ~/.config/hypr/UserConfigs/UserAnimations.conf
ln -sf $PWD/.config/hypr/UserConfigs/WindowRules.conf ~/.config/hypr/UserConfigs/WindowRules.conf
ln -sf $PWD/.config/hypr/UserConfigs/Startup_Apps.conf ~/.config/hypr/UserConfigs/Startup_Apps.conf

# Waybar
mkdir -p ~/.config/waybar/
ln -sf $PWD/.config/waybar/config ~/.config/waybar/config
ln -sf $PWD/.config/waybar/style.css ~/.config/waybar/style.css
ln -sf $PWD/.config/waybar/Modules ~/.config/waybar/Modules
ln -sf $PWD/.config/waybar/ModulesCustom ~/.config/waybar/ModulesCustom
ln -sf $PWD/.config/waybar/ModulesGroups ~/.config/waybar/ModulesGroups
ln -sf $PWD/.config/waybar/ModulesWorkspaces ~/.config/waybar/ModulesWorkspaces
ln -sf $PWD/.config/waybar/UserModules ~/.config/waybar/UserModules

# Rofi
mkdir -p ~/.config/rofi/themes/
ln -sf $PWD/.config/rofi/config.rasi ~/.config/rofi/config.rasi
ln -sf $PWD/.config/rofi/config-keybinds.rasi ~/.config/rofi/config-keybinds.rasi
ln -sf $PWD/.config/rofi/themes/red-dark.rasi ~/.config/rofi/themes/red-dark.rasi

# Swaync
mkdir -p ~/.config/swaync/
ln -sf $PWD/.config/swaync/config.json ~/.config/swaync/config.json
ln -sf $PWD/.config/swaync/style.css ~/.config/swaync/style.css

# Wlogout
mkdir -p ~/.config/wlogout/icons/
ln -sf $PWD/.config/wlogout/style.css ~/.config/wlogout/style.css
ln -sf $PWD/.config/wlogout/layout ~/.config/wlogout/layout
for f in $PWD/.config/wlogout/icons/*.svg; do ln -sf "$f" ~/.config/wlogout/icons/; done

# Kitty
mkdir -p ~/.config/kitty/
ln -sf $PWD/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

# Wallpaper
ln -sf $PWD/wallpaper.jpg ~/wallpaper.jpg
