#
# ~/.bashrc
#

# =====================================================================
#  КАСТОМНАЯ НЕОНОВАЯ СТРОКА ПРИГЛАШЕНИЯ BASH (Юзер: mmrtrip)
# =====================================================================

# Цветовые коды под наш Vaporwave стиль
PINK="\[\033[1;35m\]"
PURPLE="\[\033[1;34m\]"
CYAN="\[\033[1;36m\]"
WHITE="\[\033[0;37m\]"
RESET="\[\033[0m\]"

# Сама строка: [Имя] в фиолетовом -> Папка в розовом -> Неоновая стрелка
PS1="${PURPLE}[${WHITE}\u${PURPLE}]${RESET} ${PINK}\w${RESET} ${CYAN}❯${RESET} "
fastfetch
sh ~/dotfiles/fastfetch/quote.sh


# =====================================================================
#  КАСТОМНЫЕ АЛИАСЫ ДЛЯ ЛЕНИВОГО ЧИЛЛА (Юзер: mmrtrip)
# =====================================================================

# 1. Наша автоматическая синхронизация с Гитхабом одной буквой!
alias sync="sh ~/dotfiles/sync.sh"

# 2. Управление пакетами Pacman без лишней писанины
alias install="sudo pacman -S --needed"         # Установка пакета (например: install mpv)
alias upd="sudo pacman -Syu"        # Полное обновление всей системы одной командой
alias remv="sudo pacman -Rns"        # Чистое удаление программы вместе с её мусором

# 3. Быстрый и удобный просмотр файлов
alias ls="ls --color=auto -la"          # ls сразу показывает всё: скрытые файлы, права и сочные цвета
alias c="clear"                         # Очистить терминал одной буквой 'c'
alias q="exit"                          # Закрыть терминал одной буквой 'q'
#alias ls='ls --color=auto'
alias grep='grep --color=auto'

# 4. Быстрый доступ к главным конфигам из любой точки системы
alias i3conf="nano ~/dotfiles/i3/.config/i3/config"
alias bshconf="nano ~/dotfiles/bash/.bashrc"
alias nanoconf="nano ~/dotfiles/nano/.nanorc"

alias pin="mousepad ~/.config/my_pinned_clips.txt"
alias cc="echo "" > ~/.cache/my_clip_history.txt"

alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'

alias ch="~/check_phone.sh"
