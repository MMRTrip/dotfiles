#!/usr/bin/env python3
import subprocess
import time
import os

history_file = os.path.expanduser("~/.cache/my_clip_history.txt")
pinned_file = os.path.expanduser("~/.config/my_pinned_clips.txt")
last_clip = ""

# Создаем файл для закрепов, если его нет
if not os.path.exists(pinned_file):
    with open(pinned_file, "w") as f:
        f.write("📌 Пример закрепа (измени меня в ~/.config/my_pinned_clips.txt)\n")

while True:
    try:
        current_clip = subprocess.check_output(["xclip", "-selection", "clipboard", "-o"], stderr=subprocess.DEVNULL).decode('utf-8').strip()
        if current_clip and current_clip != last_clip:
            last_clip = current_clip
            
            # Читаем закрепленные элементы, чтобы не дублировать их в историю
            pinned_lines = []
            if os.path.exists(pinned_file):
                with open(pinned_file, "r") as f:
                    pinned_lines = [l.strip() for l in f.readlines() if l.strip()]

            # Если скопированное уже есть в закрепах, не пишем в обычную историю
            if current_clip not in pinned_lines:
                lines = []
                if os.path.exists(history_file):
                    with open(history_file, "r") as f:
                        lines = f.readlines()
                
                lines = [l for l in lines if l.strip() != current_clip]
                lines.insert(0, current_clip + "\n")
                with open(history_file, "w") as f:
                    f.writelines(lines[:50])
    except Exception:
        pass
    time.sleep(1)
