#!/bin/bash

# Скрипт автоматического деплоя визитки на GitHub Pages

echo "🚀 Деплой цифровой визитки на GitHub Pages"
echo ""

# Проверка наличия фото
if [ ! -f "assets/images/profile.jpg" ]; then
    echo "❌ Ошибка: Не найдено фото профиля!"
    echo "Сохраните ваше фото как assets/images/profile.jpg"
    exit 1
fi

# Запрос GitHub username
read -p "Введите ваш GitHub username: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ Ошибка: GitHub username не может быть пустым"
    exit 1
fi

# Запрос названия репозитория
read -p "Введите название репозитория (по умолчанию: digital-card): " REPO_NAME
REPO_NAME=${REPO_NAME:-digital-card}

echo ""
echo "📝 Настройки:"
echo "  GitHub Username: $GITHUB_USERNAME"
echo "  Репозиторий: $REPO_NAME"
echo ""

# Инициализация git если еще не инициализирован
if [ ! -d ".git" ]; then
    echo "🔧 Инициализация git..."
    git init
    echo "✅ Git репозиторий создан"
fi

# Добавление файлов
echo "📦 Добавление файлов..."
git add .

# Создание коммита
echo "💾 Создание коммита..."
git commit -m "Initial commit: Digital business card for conferences"

# Проверка наличия remote
if git remote | grep -q "origin"; then
    echo "⚠️  Remote 'origin' уже существует, пропускаю..."
else
    echo "🔗 Добавление remote репозитория..."
    git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
fi

# Переименование ветки в main
git branch -M main

echo ""
echo "⚡ Готово к загрузке на GitHub!"
echo ""
echo "📋 Следующие шаги:"
echo ""
echo "1. Создайте репозиторий на GitHub:"
echo "   https://github.com/new"
echo "   Название: $REPO_NAME"
echo "   Тип: Public"
echo "   НЕ создавайте README"
echo ""
echo "2. После создания репозитория, выполните:"
echo "   git push -u origin main"
echo ""
echo "3. Включите GitHub Pages:"
echo "   Settings → Pages → Source: main branch → Save"
echo ""
echo "4. Ваша визитка будет доступна по адресу:"
echo "   https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
echo ""
echo "5. Создайте QR-код на https://www.qr-code-generator.com/"
echo "   используя этот URL"
echo ""

# Спросить, хотят ли они сразу запушить
read -p "Хотите сразу загрузить на GitHub? (y/n): " PUSH_NOW

if [ "$PUSH_NOW" = "y" ] || [ "$PUSH_NOW" = "Y" ]; then
    echo ""
    echo "🚀 Загрузка на GitHub..."
    git push -u origin main

    if [ $? -eq 0 ]; then
        echo ""
        echo "✅ Успешно загружено!"
        echo ""
        echo "🎉 Теперь включите GitHub Pages:"
        echo "   https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings/pages"
        echo ""
        echo "Ваша визитка: https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
    else
        echo ""
        echo "❌ Ошибка загрузки. Возможные причины:"
        echo "   - Репозиторий еще не создан на GitHub"
        echo "   - Проблемы с авторизацией"
        echo ""
        echo "Создайте репозиторий и выполните вручную:"
        echo "   git push -u origin main"
    fi
else
    echo ""
    echo "👌 Хорошо! Когда будете готовы, выполните:"
    echo "   git push -u origin main"
fi

echo ""
echo "✨ Готово!"
