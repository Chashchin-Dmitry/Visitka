#!/usr/bin/env python3
import qrcode
from PIL import Image, ImageDraw

# URL визитки
url = "https://chashchin-dmitry.github.io/Visitka/"

# Создание QR-кода с большими краями для iPhone обоев
qr_iphone = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_H,  # Высокая устойчивость к повреждениям
    box_size=20,  # Увеличенный размер для четкости
    border=10,  # БОЛЬШИЕ отступы вокруг
)

qr_iphone.add_data(url)
qr_iphone.make(fit=True)

# Создание базового QR-кода
img_base = qr_iphone.make_image(fill_color="black", back_color="white")

# Создание изображения для iPhone с еще большими краями
# Размер для iPhone (квадрат с огромными отступами)
iphone_size = 1500
qr_size = 1000  # Размер самого QR-кода

# Создаем белый фон
img_iphone = Image.new('RGB', (iphone_size, iphone_size), 'white')

# Изменяем размер QR-кода
img_base_resized = img_base.resize((qr_size, qr_size), Image.Resampling.LANCZOS)

# Вставляем QR-код по центру (с большими отступами со всех сторон)
offset = (iphone_size - qr_size) // 2
img_iphone.paste(img_base_resized, (offset, offset))

# Сохраняем версию для iPhone
img_iphone.save("qr_code_iphone_wallpaper.png")
print(f"📱 QR-код для обоев iPhone создан: qr_code_iphone_wallpaper.png (1500x1500px)")
print(f"   Большие отступы по краям для удобного сканирования")
print(f"🔗 URL: {url}")

# Создание обычного QR-кода
qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_H,
    box_size=10,
    border=4,
)

qr.add_data(url)
qr.make(fit=True)

img = qr.make_image(fill_color="black", back_color="white")
img.save("qr_code.png")
print(f"✅ QR-код создан: qr_code.png")

# Создание большой версии для печати (300 DPI)
img_large = qr.make_image(fill_color="black", back_color="white")
img_large = img_large.resize((1200, 1200), Image.Resampling.LANCZOS)
img_large.save("qr_code_print.png")
print(f"🖨️  QR-код для печати создан: qr_code_print.png (1200x1200px)")
