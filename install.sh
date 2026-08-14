#!/bin/bash

# Цвета для красивого вывода в терминал
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

clear
echo -e "${PURPLE}==================================================${NC}"
echo -e "${CYAN}     ДОБРО ПОЖАЛОВАТЬ В УСТАНОВЩИК BOYKISSER OS   ${NC}"
echo -e "${PURPLE}==================================================${NC}"
echo ""
echo -e " Выберите действие:"
echo -e "  ${YELLOW}1)${NC} ПОЛНАЯ УСТАНОВКА (X11, Драйверы, Звук, Софт и Конфиги)"
echo -e "  ${YELLOW}2)${NC} ТОЛЬКО ВОССТАНОВЛЕНИЕ КОНФИГОВ (Stow-симлинки)"
echo -e "  ${YELLOW}3)${NC} ВЫХОД В КОНСОЛЬ"
echo ""
read -p " Введите цифру [1-3]: " CHOICE

case $CHOICE in
    1)
        echo ""
        echo -e "${CYAN}[1/5] Установка X-сервера, драйверов, Mesa и шрифтов...${NC}"
        sudo pacman -Syy --needed xorg-server xorg-xinit xorg-xrandr xf86-video-intel xf86-video-amdgpu mesa mesa-utils ttf-dejavu ttf-liberation noto-fonts

        echo -e "${CYAN}[2/5] Настройка звуковой подсистемы и микшеров...${NC}"
        sudo pacman -S --needed pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber alsa-utils

        echo -e "${CYAN}[3/5] Накат сети, софта, мультимедиа и кодеков...${NC}"
        sudo pacman -S --needed networkmanager network-manager-applet i3-wm i3status polybar rofi dmenu picom feh kitty fastfetch stow git brightnessctl scrot udiskie xdg-user-dirs ffmpeg mpv vlc celluloid x265 libheif file-roller p7zip unrar unzip zip nano nano-syntax-highlighting mousepad htop firefox

        echo -e "${CYAN}[4/5] Настройка прав доступа Polkit для дисков...${NC}"
        sudo mkdir -p /etc/polkit-1/rules.d
        sudo bash -c 'cat << EOF > /etc/polkit-1/rules.d/10-udisks2.rules
polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.udisks2.filesystem-mount" ||
         action.id == "org.freedesktop.udisks2.filesystem-mount-system") &&
        subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});
EOF'
        ;;
    2)
        echo ""
        echo -e "${CYAN}Пропускаем установку софта. Переходим к конфигам...${NC}"
        ;;
    *)
        echo -e "${YELLOW}Выход в консоль. Чилл режим активирован.${NC}"
        exit 0
        ;;
esac

# Шаг 5. Этот блок выполняется и для полной установки, и для восстановления дотфайлов
echo -e "${CYAN}[5/5] Применение дотфайлов через GNU Stow...${NC}"
xdg-user-dirs-update
mkdir -p ~/Pictures/Screenshots
mkdir -p ~/.config

cd ~/dotfiles
rm -rf ~/.config/i3 ~/.config/kitty ~/.config/polybar ~/.config/fastfetch ~/.config/i3status ~/.config/picom ~/.nanorc ~/.bashrc 2>/dev/null

stow i3 kitty polybar polybar-script fastfetch nano bash i3status picom

echo ""
echo -e "${GREEN}==================================================${NC}"
echo -e "${GREEN}    Boykisser OS успешно развёрнута из пепла!     ${NC}"
echo -e "${GREEN}==================================================${NC}"
