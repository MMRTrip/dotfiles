#!/bin/bash
cd ~/dotfiles

# Проверяем, есть ли вообще изменения
if [[ -z $(git status -s) ]]; then
    echo -e "\033[0;32mВсе конфиги актуальны, обновлять нечего!\033[0m"
    exit 0
fi

echo -e "\033[0;36mНайдено обновление в конфигах. Упаковываем...\033[0m"
git add .

# Автоматический коммит с текущей датой и временем
CURRENT_TIME=$(date "+%Y-%m-%d %H:%M:%S")
git commit -m "Auto-update: $CURRENT_TIME"

echo -e "\033[0;35mОтправляем на GitHub...\033[0m"
git push
echo -e "\033[0;32mСинхронизация Boykisser OS успешно завершена!\033[0m"
