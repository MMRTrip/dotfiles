**🐾 Boykisser OS v1.0 (Arch Linux + i3wm dotfiles)**  
   
   
 Добро пожаловать в репозиторий конфигурации **Boykisser OS v1.0** на базе Arch Linux и i3-gaps, оптимизированный для работы на легких или старых системах X11.  
   
    
**🛠️ Основные компоненты системы**  
*   **ОС / Окружение:** Arch Linux LTS, i3-gaps, Polybar, Picom  
   
 *   **Терминал и утилиты:** Kitty, Fastfetch, Rofi (с кастомной темой), Feh  
   
 *   **Софт:** Firefox, Obsidian, qBittorrent, PipeWire, Betterlockscreen  
   
    
   
 Полный список пакетов доступен в файле packages.txt в репозитории.  
   
    
**⌨️ Горячие клавиши**  
*   $mod + . / , / / - меню эмодзи, каомодзи и спецсимволов через rofimoji.  
   
 *   $mod + Shift + V - умный буфер обмена с поддержкой закрепленных элементов.  
   
 *   $mod + Shift + E - розовое меню питания (блокировка, выход, перезагрузка, выключение).  
   
 *   PrintSc / $mod + Shift + S - создание скриншотов.  
   
    
**🚀 Быстрая установка**  
1. Клонируйте репозиторий: git clone https://github.com/MMRTrip/dotfiles ~/dotfiles  
2. Установите пакеты: sudo pacman -S - < packages.txt  
3. Примените конфигурацию через GNU Stow (```stow i3 kitty polybar polybar-script fastfetch nano bash i3status picom betterlockscreen x11 grub firefox sddm script```).  
