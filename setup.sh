#!/bin/bash
echo "🚀 MasalBox otomatik kurulum başlıyor..."

# Node.js kontrolü
if ! command -v node &> /dev/null
then
    echo "❌ Node.js yüklü değil. Lütfen https://nodejs.org adresinden LTS sürümünü kur."
    exit 1
fi

# Proje klasörüne geç
cd "$(dirname "$0")"

# Bağımlılıkları yükle
echo "📦 NPM bağımlılıkları yükleniyor..."
npm install

# Tailwind config kontrolü
if [ ! -f "tailwind.config.js" ]; then
    echo "⚙️ Tailwind config bulunamadı, oluşturuluyor..."
    npx tailwindcss init -p
fi

# Geliştirme sunucusunu başlat
echo "🌐 Sunucu başlatılıyor..."
npm run dev

echo "✅ Her şey hazır! Tarayıcıdan http://localhost:3000 adresine git."
