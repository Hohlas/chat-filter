#!/bin/bash

# Скрипт для запуска Telegram бота в фоновом режиме

BOT_NAME="telegram-chat-analyzer"

echo "🚀 Запуск Telegram Chat Analyzer в фоновом режиме..."

# Проверка наличия screen
if ! command -v screen &> /dev/null; then
    echo "📦 Screen не установлен. Установка..."
    sudo apt-get update
    sudo apt-get install -y screen
fi

# Проверка, не запущен ли уже бот
if screen -list | grep -q "$BOT_NAME"; then
    echo "⚠️  Бот уже запущен!"
    echo "Используйте: screen -r $BOT_NAME для подключения"
    echo "Или: ./stop_bot.sh для остановки"
    exit 1
fi

# Запуск бота в screen
screen -dmS "$BOT_NAME" bash -c "python3 main.py; exec bash"

echo "✅ Бот запущен в фоновом режиме!"
echo ""
echo "📌 Полезные команды:"
echo "  screen -r $BOT_NAME  - подключиться к боту"
echo "  screen -ls           - список всех сессий"
echo "  Ctrl+A, затем D      - отключиться от сессии (бот продолжит работать)"
echo "  ./stop_bot.sh        - остановить бота"

