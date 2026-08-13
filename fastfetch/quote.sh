#!/bin/bash
# Скрипт случайных цитат для Boykisser OS
QUOTE_FILE="$HOME/dotfiles/fastfetch/quotes.txt"

if [ -f "$QUOTE_FILE" ]; then
    # Выбираем случайную строку
    RANDOM_QUOTE=$(shuf -n 1 "$QUOTE_FILE")
    # Выводим её розовым цветом под цвет румянца котика
    echo -e "\033[1;35m 💬 \"$RANDOM_QUOTE\"\033[0m"
    echo ""
fi
