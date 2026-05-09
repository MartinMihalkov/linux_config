# Дефиниране на пътищата
BASHRC_DEST="$HOME/Documents/linux_config/bash"
BASHRC_SRC="$HOME/.bashrc"

# 1. Изтриваме старата папка в дестинацията, ако съществува
if [ -d "$BASHRC_DEST" ]; then
    echo "Изтриване на старата папка: $BASHRC_DEST"
    rm -rf "$BASHRC_DEST"
fi

# 2. Създаваме дестинацията наново
mkdir -p "$BASHRC_DEST"

# 3. Копираме файла .bashrc
if [ -f "$BASHRC_SRC" ]; then
    echo "Копиране на $BASHRC_SRC към $BASHRC_DEST..."
    cp "$BASHRC_SRC" "$BASHRC_DEST/"
    echo "Готово! Конфигурацията на Bash е архивирана."
else
    echo "Грешка: Файлът $BASHRC_SRC не беше намерен."
fi
