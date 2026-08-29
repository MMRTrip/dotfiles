#!/bin/bash

# Варианты меню с красивыми иконками
lock="🔒 lock"
suspend="💤 suspend"
logout="🚪 logout"
reboot="🔄 reboot"
shutdown="🛑 shutdown"

# Склеиваем пункты для Rofi (теперь с режимом сна)
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

# Запускаем Rofi в режиме dmenu
chosen="$(echo -e "$options" | rofi -dmenu -p "Power Menu" -i)"

# Выполняем выбранное действие
case $chosen in
    *$lock)
        betterlockscreen -l
        ;;
    *$suspend)
        # Блокируем экран перед тем, как уйти в сон
        betterlockscreen -l && systemctl suspend
        ;;
    *$logout)
        i3-msg exit
        ;;
    *$reboot)
        systemctl reboot
        ;;
    *$shutdown)
        systemctl poweroff
        ;;
esac
