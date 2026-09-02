#!/bin/bash
# Запускаем Happ Desktop в фоне
happ-desktop &

# Ждем 3 секунды, пока Happ поднимет локальные порты
sleep 3

# Прописываем переменные окружения, чтобы всё, что запустит i3, видело прокси
export http_proxy="http://127.0.0.1:10809"
export https_proxy="http://127.0.0.1:10809"
export all_proxy="socks5://127.0.0.1:10808"
