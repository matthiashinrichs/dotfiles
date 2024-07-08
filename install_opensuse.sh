# This script installs the required files to run hyprland on openSuse Tumbleweed

PACKAGES="git kitty zsh hyprland hyprcursor hyprpaper hypridle xdg-desktop-portal-hyprland dunst swaybar ripgrep wlogout"


# Install packages

sudo zypper -n install $PACKAGES

# Install fonts

cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip
unzip Meslo.zip
rm Meslo.zip
