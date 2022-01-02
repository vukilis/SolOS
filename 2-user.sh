#!/usr/bin/env bash
#-------------------------------------------------------------------------
#  .d8888b.           888  .d88888b.   .d8888b.  
# d88P  Y88b          888 d88P" "Y88b d88P  Y88b 
# Y88b.               888 888     888 Y88b.      
#  "Y888b.    .d88b.  888 888     888  "Y888b.   
#     "Y88b. d88""88b 888 888     888     "Y88b. 
#       "888 888  888 888 888     888       "888 
# Y88b  d88P Y88..88P 888 Y88b. .d88P Y88b  d88P 
#  "Y8888P"   "Y88P"  888  "Y88888P"   "Y8888P" 
#-------------------------------------------------------------------------

echo -e "\nINSTALLING AUR SOFTWARE\n"
# You can solve users running this script as root with this and then doing the same for the next for statement. However I will leave this up to you.

echo "CLONING: YAY"
cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ${HOME}/yay
makepkg -si --noconfirm
cd ~
git clone "https://github.com/vukilis/ZSH_terminal.git"
cd ${HOME}/ZSH_terminal
bash arch-setup.sh
cd ~

PKGS=(
#'autojump'
'awesome-terminal-fonts'
'brave-bin' # Brave Browser
'dxvk-bin' # DXVK DirectX to Vulcan
#'github-desktop-bin' # Github Desktop sync
'lightly-git'
'lightlyshaders-git'
'mangohud' # Gaming FPS Counter
'mangohud-common'
'nerd-fonts-fira-code'
'nordic-darker-standard-buttons-theme'
'nordic-darker-theme'
'nordic-kde-git'
'nordic-theme'
'noto-fonts-emoji'
'papirus-icon-theme'
'plasma-pa'
'ocs-url' # install packages from websites
'sddm-nordic-theme-git'
'snapper-gui-git'
'ttf-droid'
'ttf-hack'
'ttf-meslo' # Nerdfont package
'ttf-roboto'
#'zoom' # video conferences
'snap-pac'
)

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

export PATH=$PATH:~/.local/bin
cp -r $HOME/SolOS/dotfiles/* $HOME/.config/
pip install konsave
konsave -i $HOME/SolOS/kde.knsv
sleep 1
konsave -a kde

echo -e "\nDone!\n"
exit
