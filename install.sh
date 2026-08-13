#!/bin/bash

# Цвета для красивого вывода в терминал
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${PURPLE}==================================================${NC}"
echo -e "${CYAN}   Запуск установщика Boykisser OS v1.0 (Arch)    ${NC}"
echo -e "${PURPLE}==================================================${NC}"
echo ""

# Шаг 1. Обновление баз данных и установка всех необходимых пакетов
echo -e "${CYAN}[1/4] Установка системных утилит и мультимедиа...${NC}"
sudo pacman -Syy --needed \
    i3-wm i3status polybar rofi picom feh kitty fastfetch \
    stow git brightnessctl scrot udiskie xdg-user-dirs \
    ffmpeg mpv vlc celluloid x265 libheif \
    file-roller p7zip unrar unzip zip \
    nano-syntax-highlighting mousepad htop

# Шаг 2. Создание базовых папок пользователя
echo -e "${CYAN}[2/4] Создание системных директорий...${NC}"
xdg-user-dirs-update
mkdir -p ~/Pictures/Screenshots
mkdir -p ~/.config

# Шаг 3. Автоматическая настройка прав Polkit для внешних дисков
echo -e "${CYAN}[3/4] Настройка прав монтирования внешних дисков (Polkit)...${NC}"
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

# Шаг 4. Развёртывание симлинков через GNU Stow
echo -e "${CYAN}[4/4] Развёртывание конфигурационных файлов через Stow...${NC}"
cd ~/dotfiles

# Удаляем дефолтные конфиги, если они создались, чтобы stow не ругался на конфликты
rm -rf ~/.config/i3 ~/.config/kitty ~/.config/polybar ~/.config/fastfetch ~/.config/i3status ~/.config/picom ~/.nanorc ~/.bashrc 2>/dev/null

# Заплетаем наши симлинки
stow i3
stow kitty
stow polybar
stow polybar-script
stow fastfetch
stow nano
stow bash
stow i3status
stow picom

echo ""
echo -e "${GREEN}==================================================${NC}"
echo -e "${GREEN}       Boykisser OS успешно установлена!          ${NC}"
echo -e "${GREEN}  Перезапустите i3 (Mod+Shift+R) для применения.  ${NC}"
echo -e "${GREEN}==================================================${NC}"
