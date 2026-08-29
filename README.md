**🐾 Boykisser OS v1.0 (Arch Linux + i3wm dotfiles)**  
     
   
*"Семь раз отмерь, один раз mod+Shift+r нажми."* * — Цитата дня при запуске.*  
Добро пожаловать в репозиторий дотфайлов **Boykisser OS v1.0** — максимально кастомизированной, легковесной и монолитной тайлинговой среды на базе  **Arch Linux** и оконного менеджера  **i3-gaps**. Всё оформлено в едином стиле, оптимизировано под X11 и старое капризное железо ноутбуков.  
![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAnEAAAACCAYAAAA3pIp+AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAANUlEQVR4nO3OMQ2AABAAsSPBCUbfEm6YmFDBhAU2QtIq6DIzW7UHAMBfnGt1V8fXEwAAXrse/w8F7pbTa1oAAAAASUVORK5CYII=)  
**🛠️ Спецификации Системы (Fastfetch)**  
- **ОС:** Boykisser OS v1.0 (Arch Linux LTS ядро)  
- **Оконный менеджер:** i3-gaps  
- **Терминал:** Kitty  
- **Лаунчер / Меню:** Rofi (Кастомная розовая тема ❤️‍🔥)  
- **Блокировщик экрана:**betterlockscreen (с эффектом размытия текстур)  
- **Менеджер сессий (SDDM):**boykisser-sddm  
- **Тема загрузчика (GRUB):**neon_boy  
![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAnEAAAACCAYAAAA3pIp+AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAANElEQVR4nO3OQQmAABRAsad4EjtY9fewnUms4E2ELcGWmTmrKwAA/uLeqrU6vp4AAPDa/gDzWAM6QQXRdAAAAABJRU5ErkJggg==)  
**📦 Основной софт системы (Core Software)**  
Этот сетап построен на минималистичном, производительном софте и оптимизирован для работы в X11 сессии на LTS-ядре.  
| | | |  
|-|-|-|  
| **Категория** | **Пакеты** | **Для чего используется** |   
| **Основа Окружения** | i3-gaps, i3status, polybar | Тайлинговый оконный менеджер, стандартная и кастомная панели. |   
| **Графика и Эффекты** | picom, feh | Композитный менеджер для прозрачности/теней и утилита для обоев. |   
| **Терминал и Утилиты** | kitty, lsd, fastfetch, htop | Быстрый эмулятор терминала, кастомный вывод инфы и утилита ls. |   
| **Интерфейс запуска** | rofi, rofimoji | Розовое меню запуска, буфер обмена и селектор спецсимволов. |   
| **Безопасность и Вход** | sddm, betterlockscreen, xss-lock | Дисплейный менеджер, блокировщик экрана и демон блокировки по тайм-ауту. |   
| **Автоматизация X11** | xclip, xdotool, xorg-xev | Работа с буфером обмена, эмуляция ввода и отслеживание keycodes клавиш. |   
| **Мультимедиа и Звук** | pipewire, wireplumber, scrot, mpv | Современный звуковой сервер, скриншотер и легковесный медиаплеер. |   
| **Система и Железо** | linux-lts, linux-firmware, stow, yay | Стабильное LTS-ядро, прошивки, менеджер дотфайлов и AUR-помощник. |   
| **Файлы и Темы** | pcmanfm, lxappearance, materia-gtk-theme | Легковесный файловый менеджер, настройка внешнего вида и GTK-тема. |   
| **Повседневный Софт** | firefox, obsidian, qbittorrent | Браузер, заметки Obsidian и торренты. |   
   
*для удобства закинул полный список софта в репо  
![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAnEAAAACCAYAAAA3pIp+AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAMUlEQVR4nO3WAQkAIBAEsBPMYs4PZhMDWMAA5njYUmxU1UqyAwBAF2cmeZE4AIBO7gentgXapSWpbgAAAABJRU5ErkJggg==)  
**⌨️ Горячие клавиши и Управление (Кастомные бинды)**  
Вся система спроектирована под быстрое управление без мыши. Самые ходовые символы, инженерные операторы и буфер обмена вынесены на компактную панель клавиатуры и нампад.  
**🌸 Эмодзи, Каомодзи и Символы (rofimoji)**  
- $mod + . (Точка) ➡️ Меню обычных эмодзи (включая ❤️‍🔥)  
- $mod + , (Запятая) ➡️ Текстовые японские каомодзи (づ｡◕‿‿◕｡)づ  
- $mod + / (Основной слэш) ➡️ Стрелочки и указатели (🢥, →, ⇒)  
- $mod + / (Нампад / KP_Divide) ➡️ Математические операторы (∓, ∞, ∫)  
- $mod + * (Нампад / KP_Multiply) ➡️ Греческий алфавит для формул (Ω, π, α)  
**📋 Умный буфер обмена (Кастомный Python-демон)**  
- $mod + Shift + V ➡️ Открыть историю буфера обмена в Rofi.  
- **Особенность:** Поддерживает  **железные закрепы**! Всё, что вписано в файл ~/.config/my_pinned_clips.txt (команда pin), всегда будет висеть в самом верху меню с иконкой 📌. Остальная история автоматически очищается при каждом ребуте ПК ради безопасности.  
**🛑 Меню питания (Powermenu)**  
- $mod + Shift + E ➡️ Розовенький Powermenu в Rofi:  
  - 🔒 lock — Красивая и безопасная блокировка через betterlockscreen  
  - 🚪 logout — Выход из сессии i3wm  
  - 🔄 reboot — Перезагрузка системы  
  - 🛑 shutdown — Полное выключение ноутбука  
**📸 Скриншоты (Scrot / Flameshot)**  
- Print ➡️ Сделать скриншот выделенной области экрана (со звуком затвора)  
- $mod + Shift + S ➡️ Скриншот всего экрана целиком  
![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAnEAAAACCAYAAAA3pIp+AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAANklEQVR4nO3OMQ2AABAAsSNBACPq8MH2NpGACyywEZJWQZeZ2aszAAD+4l6rrTq+ngAA8Nr1AL/KBEe6dElaAAAAAElFTkSuQmCC)  
**🚀 Установка и деплой через GNU Stow**  
Все дотфайлы и скрипты разложены по пакетам для удобного управления через симлинки. Для развертывания конфигурации используется скрипт sync.sh или ручной вызов stow.  
1. Клонируй репозиторий в домашнюю папку:  
2. git clone https://github.com/MMRTrip/dotfiles.git ~/dotfiles  
 cd ~/dotfiles  
   
3. Накати нужные пакеты (например, скрипты и тему rofi) или просто установи полный список софта(```sudo pacman -S - < packages.txt```):  
4. stow scripts rofi i3 polybar-script  polybar kitty fastfetch nano bash i3status picom betterlockscreen sddm x11 grub firefox
   
![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAnEAAAACCAYAAAA3pIp+AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAANUlEQVR4nO3OQQmAABRAsSfYxKK/kYXEkyk8WcGbCFuCLTOzVXsAAPzFuVZ3dXw9AQDgtesB/v8F8JQadPwAAAAASUVORK5CYII=)  
**🩹 Известный фикс в сборке**  
- **Фикс артефактов старых видеокарт AMD (таких какRadeon HD 7610M):** Из-за капризов старых чипов Whistler при выходе из глубокого сна видеопамять могла покрываться кашей из текстур. В сборку советую добавить жёсткое правило ядра pcie_aspm=off и udev-правило 30-radeon-pm.rules, блокирующее сброс питания шины PCIe (D3cold), что полностью вылечит рандомные артефакты при выходе из сна.   
