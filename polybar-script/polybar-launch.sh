#!/bin/bash

# Находим точный PID старого автохайдера по имени файла и гасим только его
OLD_PID=$(pgrep -x -f ".*polybar-autohide.sh")
if [ -n "$OLD_PID" ]; then
    kill -9 $OLD_PID
fi

# Гасим старый polybar
pkill -9 -x polybar

# Запускаем Polybar
polybar example >/dev/null 2>&1 &
disown

# Небольшая пауза
sleep 1

# Запускаем автоскрытие
/home/mmrtrip/polybar-autohide.sh >/dev/null 2>&1 &
disown
