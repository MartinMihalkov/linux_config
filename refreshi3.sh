#!/bin/bash

# Път до дестинацията (променете го според вашите нужди)
DEST_DIR="$HOME/Documents/linux_config/i3"

# 1. Изтриваме старата папка в дестинацията, ако съществува
if [ -d "$DEST_DIR" ]; then
    echo "Изтриване на старата папка: $DEST_DIR"
    rm -rf "$DEST_DIR"
fi

# 2. Копираме актуалната конфигурация от ~/.config/i3
echo "Копиране на ~/.config/i3 към $DEST_DIR..."
cp -r "$HOME/.config/i3" "$DEST_DIR"

echo "Готово!"

