#!/bin/sh

# Настройка переключения раскладки клавиатуры (Caps Lock переключает Eng/Rus)
setxkbmap -layout us,ru -option grp:caps_toggle &

# Запускаем системную шину уведомлений и сообщений d-bus
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval $(dbus-launch --sh-syntax --exit-with-session)
fi
export DBUS_SESSION_BUS_ADDRESS

# Запускаем наш оконный менеджер i3wm
exec i3
