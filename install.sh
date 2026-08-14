#!/bin/bash

# Цвета для красивого вывода в терминал
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

clear
echo -e "${PURPLE}==================================================${NC}"
echo -e "${CYAN}     ДОБРО ПОЖАЛОВАТЬ В УСТАНОВЩИК BOYKISSER OS   ${NC}"
echo -e "${PURPLE}==================================================${NC}"
echo ""
echo -e " Выберите действие:"
echo -e "  ${YELLOW}1)${NC} ПОЛНАЯ УСТАНОВКА + АВТО-РАЗМЕТКА ДИСКА (Для установки с флешки)"
echo -e "  ${YELLOW}2)${NC} ТОЛЬКО ВОССТАНОВЛЕНИЕ КОНФИГОВ (Stow-симлинки)"
echo -e "  ${YELLOW}3)${NC} ВЫХОД В КОНСОЛЬ"
echo ""
read -p " Введите цифру [1-3]: " CHOICE

case $CHOICE in
    1)
        echo ""
        echo -e "${CYAN}[1/6] Поиск неразмеченного пространства на накопителях...${NC}"
        
        # Автоматически находим первый системный диск (пропускаем саму флешку /dev/loop)
        TARGET_DISK=$(lsblk -dno NAME,TYPE | awk '$2=="disk" && $1!~/loop/ {print "/dev/"$1; exit}')
        
        if [ -z "$TARGET_DISK" ]; then
            echo -e "${RED}[Ошибка] Физический диск для установки не найден!${NC}"
            exit 1
        fi
        
        echo -e "${YELLOW}Найдено устройство: $TARGET_DISK${NC}"
        
        # Проверяем наличие свободного места через sfdisk
        FREE_SPACE=$(sudo sfdisk -F "$TARGET_DISK" 2>/dev/null | awk '/unallocated/ {print $1}')
        
        if [ -z "$FREE_SPACE" ] || [ "$FREE_SPACE" -lt 1048576 ]; then
            echo -e "${RED}[Внимание] На диске $TARGET_DISK нет свободного неразмеченного места (нужно хотя бы 1 Гб).${NC}"
            echo -e "${YELLOW}Переходим к установке софта на текущую живую систему...${NC}"
        else
            echo -e "${GREEN}Найдено свободное место! Запуск автоматической разметки через sfdisk...${NC}"
            
            # Магия sfdisk: создаем EFI (512M) и Root (все оставшееся место) в неразмеченной области
            sudo sfdisk --append "$TARGET_DISK" << EOF
start=+512M, size=512M, Id=ef, bootable
start=+, size=+, Id=83
EOF
            echo -e "${GREEN}Диск успешно размечен! Форматируем разделы...${NC}"
            # Находим имена свежесозданных разделов (например, sda1, sda2)
            PART_EFI=$(lsblk -no NAME "$TARGET_DISK" | tail -n 2 | head -n 1 | awk '{print "/dev/"$1}')
            PART_ROOT=$(lsblk -no NAME "$TARGET_DISK" | tail -n 1 | awk '{print "/dev/"$1}')
            
            # Форматируем в FAT32 и EXT4
            sudo mkfs.vfat -F32 "$PART_EFI"
            sudo mkfs.ext4 -F "$PART_ROOT"
            
            echo -e "${GREEN}Разделы готовы. Монтируем в новую систему...${NC}"
            sudo mount "$PART_ROOT" /mnt
            sudo mkdir -p /mnt/boot
            sudo mount "$PART_EFI" /mnt/boot
        fi

        echo ""
        echo -e "${CYAN}[2/6] Установка X-сервера, драйверов, Mesa и шрифтов...${NC}"
        sudo pacman -Syy --needed xorg-server xorg-xinit xorg-xrandr xf86-video-intel xf86-video-amdgpu mesa mesa-utils ttf-dejavu ttf-liberation noto-fonts

        echo -e "${CYAN}[3/6] Настройка звуковой подсистемы и микшеров...${NC}"
        sudo pacman -S --needed pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber alsa-utils

        echo -e "${CYAN}[4/6] Накат сети, софта, мультимедиа и кодеков...${NC}"
        sudo pacman -S --needed networkmanager network-manager-applet i3-wm i3status polybar rofi dmenu picom feh kitty fastfetch stow git brightnessctl scrot udiskie xdg-user-dirs ffmpeg mpv vlc celluloid x265 libheif file-roller p7zip unrar unzip zip nano nano-syntax-highlighting mousepad htop firefox

        echo -e "${CYAN}[5/6] Настройка прав доступа Polkit для дисков...${NC}"
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
        echo -e "${CYAN}Пропускаем разметку и установку софта. Переходим к конфигам...${NC}"
        ;;
    *)
        echo -e "${YELLOW}Выход в консоль. Чилл режим активирован.${NC}"
        exit 0
        ;;
esac

# Шаг 6. Накат дотфайлов через Stow
echo -e "${CYAN}[6/6] Применение дотфайлов через GNU Stow...${NC}"
xdg-user-dirs-update
mkdir -p ~/Pictures/Screenshots
mkdir -p ~/.config

cd ~/dotfiles
rm -rf ~/.config/i3 ~/.config/kitty ~/.config/polybar ~/.config/fastfetch ~/.config/i3status ~/.config/picom ~/.nanorc ~/.bashrc 2>/dev/null
# ... (это конец Шага 5, прямо перед вызовом stow) ...

# Автоматически дарим наш прокачанный .nanorc пользователю root
sudo ln -sf /home/\$USER/dotfiles/nano/.nanorc /root/.nanorc

# Заплетаем симлинки Stow для обычного пользователя
stow i3 kitty polybar polybar-script fastfetch nano bash i3status picom betterlockscreen x11

echo ""
echo -e "${GREEN}==================================================${NC}"
echo -e "${GREEN}    Boykisser OS успешно развёрнута из пепла!     ${NC}"
echo -e "${GREEN}==================================================${NC}"
