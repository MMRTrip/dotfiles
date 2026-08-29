#!/bin/bash

# Бесконечный цикл, который крутится внутри твоей сессии i3
while true; do
    # Проверяем статус крышки (у тебя путь может быть LID или LID0, проверь через ls /proc/acpi/button/lid/)
    LID_STATE=$(cat /proc/acpi/button/lid/LID/state | awk '{print $2}')
    
    if [ "$LID_STATE" = "closed" ]; then
        # Мы внутри i3wm, права идеальные, куки на месте. Просто блокируем!
        betterlockscreen -l
        
        # Спим подольше после блокировки, чтобы не спамить экран, пока крышка закрыта
        sleep 15
    fi
    
    # Опрашиваем систему раз в 2 секунды (процессор вообще не нагружает)
    sleep 2
done
