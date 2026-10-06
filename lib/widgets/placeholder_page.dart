import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Halaman dummy buat tombol-tombol selain Home & Profile.
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.sentiment_satisfied_alt_rounded,
  });

  final String title;
  final String message;
  final IconData icon;

  /// Biar gampang dipanggil dari mana aja.
  static void open(
    BuildContext context, {
    required String title,
    String? message,
    IconData icon = Icons.sentiment_satisfied_alt_rounded,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PlaceholderPage(
          title: title,
          message: message ?? '$title lewat sini yaa :)',
          icon: icon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              size: 20, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.lavenderTop, AppColors.cardViolet],
                  ),
                ),
                child: Icon(icon, size: 56, color: Colors.white),
              ),
              const SizedBox(height: 28),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.ovoPurpleText,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Ini baru tampilannya aja ya, fiturnya belum bisa dipakai.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: AppColors.textGrey),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 180,
                height: 44,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.ovoPurpleBright,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'Kembali',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
