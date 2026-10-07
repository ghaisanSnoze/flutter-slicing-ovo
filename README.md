# Slicing OVO — Tugas Praktikum Flutter

Slicing tampilan aplikasi OVO untuk tugas mobile programming, kelas XI RPL.

## Fitur
- **Home**: header OVO + Promo, kartu OVO Cash bergradient (tap "Tap untuk lihat" untuk lihat saldo),
  carousel info + badge OVO Stamp, tab menu (Favorit / Finansial / Hiburan / Pilihan Lain),
  grid layanan, banner promo, bottom navigation dengan tombol QRIS.
- **Profile**: data user, OVO Premier / OVO Score / OVO Stamp, OVO ID (QR Code & Barcode), menu Akun.
- Tombol lain (Finance, Pay/QRIS, Inbox, Top Up, Transfer, menu layanan, dll) bisa dipencet,
  nanti kebuka halaman simpel, contohnya: **"Bayar lewat sini yaa :)"**.

## Struktur Folder
```
lib/
├── main.dart
├── theme/app_colors.dart
├── pages/
│   ├── main_page.dart      # bottom nav + ganti halaman
│   ├── home_page.dart
│   └── profile_page.dart
└── widgets/
    ├── ovo_logo.dart        # logo OVO outline (tanpa file gambar)
    ├── ovo_cash_card.dart
    ├── service_menu.dart
    ├── promo_widgets.dart   # carousel info, badge Stamp, banner
    ├── ovo_bottom_nav.dart
    └── placeholder_page.dart
```

## Cara Menjalankan
```bash
flutter pub get
flutter run
```

## Screenshot
| Home | Profile |
|------|---------|
| ![Home](<img width="534" height="1036" alt="Screenshot from 2026-10-07 11-28-22" src="https://github.com/user-attachments/assets/fc187845-cc53-48f7-bfba-36199f8c745c" />) | ![Profile](<img width="534" height="1036" alt="Screenshot from 2026-10-07 11-30-13" src="https://github.com/user-attachments/assets/9c67c122-f4c3-4211-aec4-1ea6343b9464" />
) |

Font: Plus Jakarta Sans (SIL Open Font License).
