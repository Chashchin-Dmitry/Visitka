#!/usr/bin/env python3
import qrcode
from PIL import Image

# URL визитки
url = "https://chashchin-dmitry.github.io/Visitka/"

# Создание QR-кода
qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_H,  # Высокая устойчивость к повреждениям
    box_size=10,
    border=4,
)

qr.add_data(url)
qr.make(fit=True)

# Создание изображения
img = qr.make_image(fill_color="black", back_color="white")

# Сохранение QR-кода в разных размерах
img.save("qr_code.png")
print(f"✅ QR-код создан: qr_code.png")
print(f"📱 URL: {url}")

# Создание большой версии для печати (300 DPI)
img_large = qr.make_image(fill_color="black", back_color="white")
img_large = img_large.resize((1200, 1200), Image.Resampling.LANCZOS)
img_large.save("qr_code_print.png")
print(f"🖨️  QR-код для печати создан: qr_code_print.png (1200x1200px)")
