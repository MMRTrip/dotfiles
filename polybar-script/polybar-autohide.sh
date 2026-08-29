#!/bin/bash

# Триггер для экрана 1366x768
TRIGGER_Y=730

while true; do
    if pgrep -x "polybar" > /dev/null; then
        eval $(xdotool getmouselocation --shell)
        
        if [ "$Y" -gt "$TRIGGER_Y" ]; then
            # Тихо показываем панель и поднимаем её на передний план
            polybar-msg cmd show >/dev/null 2>&1
            WIN_ID=$(xdotool search --class "polybar" | head -n 1)
            if [ -n "$WIN_ID" ]; then
                xdotool windowraise "$WIN_ID"
            fi
        else
            # Тихо скрываем панель
            polybar-msg cmd hide >/dev/null 2>&1
        fi
    fi
    sleep 0.1
done
