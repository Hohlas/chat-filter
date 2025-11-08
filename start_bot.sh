#!/bin/bash

# Скрипт для запуска Telegram бота

echo "🚀 Запуск Telegram Chat Analyzer..."

# Проверка наличия Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 не найден. Установите Python 3."
    exit 1
fi

# Проверка наличия файла конфигурации
if [ ! -f "private.txt" ]; then
    echo "❌ Файл private.txt не найден!"
    echo "Создайте файл private.txt с вашими API ключами."
    exit 1
fi

# Проверка наличия зависимостей
if ! python3 -c "import telethon" &> /dev/null; then
    echo "📦 Установка зависимостей..."
    pip3 install -r requirements.txt
fi

# Запуск бота
echo "✅ Запуск бота..."
python3 main.py

