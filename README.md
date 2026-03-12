# myPS1
Linux bash prompt style


Add to .bashrc and enjoy.

# Also htop configuration
Copy the file and the folder structure to your $HOME


# Also a .vimrc file with a cheat sheet in it

 - Install [fzf](https://github.com/junegunn/fzf) 
 - Install [ripgrep](https://github.com/BurntSushi/ripgrep)
 - Install [neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
 - Install [neovide](https://neovide.dev/installation.html)

Add to your home

# Also a .zshrc file with myconf

 - Install [oh-my-zsh](https://ohmyz.sh/#install)
 - Install [antigen](https://github.com/zsh-users/antigen)
 - Install [fzf](https://github.com/junegunn/fzf) and [fd](https://github.com/sharkdp/fd)

Add to your home

[![Sample text](https://img.youtube.com/vi/avr_sCFKthw/0.jpg)](https://www.youtube.com/watch?time_continue=23&v=avr_sCFKthw)

# Hyprland (Wayland)

Custom config on top of [JaKooLit Hyprland dotfiles](https://github.com/JaKooLit/Debian-Hyprland). Install the base dotfiles first, then run `create_symlinks.sh` to apply overrides.

## Prerequisites

 - [Hyprland](https://hyprland.org/) (compiled from source on Debian 13, v0.53.3)
 - [JaKooLit Debian-Hyprland](https://github.com/JaKooLit/Debian-Hyprland) base dotfiles
 - NVIDIA drivers with `nvidia-drm.modeset=1` and `nvidia-drm.fbdev=1` kernel params

## Dependencies

 - `waybar` - Status bar
 - `rofi` - App launcher
 - `swaync` - Notification center
 - `kitty` - Terminal
 - `hyprlock` - Screen locker
 - `hypridle` - Idle daemon
 - `swww` - Wallpaper daemon
 - `wlogout` - Power menu
 - `playerctl` - Media controls
 - `btop` - System monitor
 - `nvtop` - GPU monitor
 - `ncdu` - Disk usage analyzer
 - `blueman` - Bluetooth manager

## What's included

 - **Hyprland**: Dual monitor setup (DP-1 primary + HDMI-A-2 rotated vertical), workspace assignments, window rules, keybinds, US altgr-intl keyboard layout
 - **Waybar**: Red/black theme, custom modules (GPU via nvidia-smi, dual disk partitions, Debian apt updater), grouped drawers for network/bluetooth/keyboard
 - **Rofi**: Red/black theme matching Waybar
 - **Swaync**: Dark red notification theme, right-aligned
 - **Kitty**: Font size 12

## NVIDIA Wayland env vars

Set in `/etc/environment.d/nvidia-wayland.conf`:
```
WLR_NO_HARDWARE_CURSORS=1
GBM_BACKEND=nvidia-drm
__GLX_VENDOR_LIBRARY_NAME=nvidia
```

# i3 (Xorg)

Config included in `.config/i3/config`.

# Sway (Wayland)

Config included in `.config/sway/config`. Requires `--unsupported-gpu` flag for NVIDIA.
