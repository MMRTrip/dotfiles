#!/bin/bash

# Цвета для красивого вывода в терминал
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${PURPLE}==================================================${NC}"
echo -e "${CYAN}   ПОЛНАЯ УСТАНОВКА METADISTRO: BOYKISSER OS      ${NC}"
echo -e "${PURPLE}==================================================${NC}"
echo ""

# Шаг 1. Базовое графическое окружение X11, Драйверы и Движок Mesa
echo -e "${CYAN}[1/5] Установка X-сервера, драйверов, Mesa и шрифтов...${NC}"
sudo pacman -Syy --needed \
    xorg-server xorg-xinit xorg-xrandr \
    xf86-video-intel xf86-video-amdgpu \
    mesa mesa-utils ttf-dejavu ttf-liberation noto-fonts

# Шаг 2. Звуковой сервер (PipeWire + PulseAudio эмуляция для pactl)
echo -e "${CYAN}[2/5] Настройка звуковой подсистемы...${NC}"
sudo pacman -S --needed \
    pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber

# Шаг 3. Весь наш кастомный софт, плееры, текстовые редакторы и кодеки
echo -e "${CYAN}[3/5] Накат софта, мультимедиа и кодеков...${NC}"
sudo pacman -S --needed \
    i3-wm i3status polybar rofi picom feh kitty fastfetch \
    stow git brightnessctl scrot udiskie xdg-user-dirs betterlockscreen \
    ffmpeg mpv vlc celluloid x265 libheif \
    file-roller p7zip unrar unzip zip \
    nano nano-syntax-highlighting mousepad htop

# Шаг 4. Настройка прав Polkit для флешек и дисков без ввода sudo
echo -e "${CYAN}[4/5] Настройка прав доступа Polkit...${NC}"
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

# Шаг 5. Подготовка папок и развёртывание Stow
echo -e "${CYAN}[5/5] Применение дотфайлов через GNU Stow...${NC}"
xdg-user-dirs-update
mkdir -p ~/Pictures/Screenshots
mkdir -p ~/.config

cd ~/dotfiles
# Сносим дефолтный шлак, чтобы Stow не выдавал конфликты
rm -rf ~/.config/i3 ~/.config/kitty ~/.config/polybar ~/.config/fastfetch ~/.config/i3status ~/.config/picom ~/.nanorc ~/.bashrc 2>/dev/null

# Заплетаем симлинки
stow i3 kitty polybar polybar-script fastfetch nano bash i3status picom

echo ""
echo -e "${GREEN}==================================================${NC}"
echo -e "${GREEN}    Boykisser OS успешно развёрнута из пепла!     ${NC}"
echo -e "${GREEN}  Пропишите startx или перезапустите i3.          ${NC}"
echo -e "${GREEN}==================================================${NC}"
