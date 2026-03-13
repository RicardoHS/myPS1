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
 - `sddm` - Display manager
 - `playerctl` - Media controls
 - `btop` - System monitor
 - `nvtop` - GPU monitor
 - `ncdu` - Disk usage analyzer
 - `blueman` - Bluetooth manager
 - `hyprtoolkit` - Hypr ecosystem dependency (compile from source)
 - `hyprland-guiutils` - Hypr GUI dialogs (compile from source)

## What's included

 - **Hyprland**: Dual monitor setup (DP-1 2560x1440 primary + HDMI-A-2 1920x1080 rotated vertical), workspace assignments (1-6 on DP-1, 7-10 on HDMI-A-2), window rules, keybinds (close=Mod+Shift+Q, fullscreen=Mod+F, float=Mod+Shift+Space, refresh=Mod+Shift+R, power=Mod+Backspace), US altgr-intl + ES keyboard layouts, cursor default on DP-1
 - **Waybar**: Red/black (#aa3333) theme, dual bar (full on DP-1, workspaces+clock on HDMI-A-2), custom modules (GPU via nvidia-smi, dual disk partitions, Debian apt updater), grouped drawers for network/bluetooth/keyboard
 - **Rofi**: Red/black theme, mouse hover disabled
 - **Swaync**: Dark red notification theme, right-aligned
 - **Wlogout**: Red/black SVG icons, 5 buttons (lock, reboot, shutdown, logout, suspend)
 - **Hyprlock**: Red/black lock screen with wallpaper background, 24h clock
 - **Kitty**: Red/black color theme, font size 12
 - **SDDM**: Red/black theme (simple_sddm_2), JetBrainsMono font, wallpaper background

## Manual steps after symlinks

Some configs cannot be symlinked and need manual setup:

### SDDM theme
```bash
sudo cp .config/sddm/theme.conf /usr/share/sddm/themes/simple_sddm_2/theme.conf
sudo cp wallpaper.jpg /usr/share/sddm/themes/simple_sddm_2/Backgrounds/wallpaper.jpg
sudo mkdir -p /etc/sddm.conf.d
echo -e "[Theme]\nCurrent=simple_sddm_2" | sudo tee /etc/sddm.conf.d/theme.conf
sudo systemctl enable sddm
```

### Wlogout button count
Edit `~/.config/hypr/scripts/Wlogout.sh` and change `-b 6` to `-b 5` on all `wlogout` lines.

### SDDM monitor focus
To make SDDM show on the primary monitor:
```bash
sudo tee /etc/X11/xorg.conf.d/10-monitor.conf << 'EOF'
Section "Monitor"
    Identifier "HDMI-A-2"
    Option "Primary" "false"
EndSection
Section "Monitor"
    Identifier "DP-1"
    Option "Primary" "true"
EndSection
EOF
```

### PATH for SDDM sessions
SDDM doesn't load `.profile`. Add to `~/.zshenv`:
```bash
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
```

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
