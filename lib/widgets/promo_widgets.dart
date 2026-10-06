import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'ovo_logo.dart';
import 'placeholder_page.dart';

// ---------------------------------------------------------------------------
// Carousel kartu info ("Cek data kamu ...")
// ---------------------------------------------------------------------------

class InfoCardCarousel extends StatefulWidget {
  const InfoCardCarousel({super.key});

  @override
  State<InfoCardCarousel> createState() => _InfoCardCarouselState();
}

class _InfoCardCarouselState extends State<InfoCardCarousel> {
  final _controller = PageController(viewportFraction: 0.9);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView(
        controller: _controller,
        padEnds: false,
        children: [
          _InfoCard(
            text: 'Cek data kamu demi kelancaran pemakaian akun OVO Premier kamu',
            button: 'Cek',
            icon: const _KeyIcon(),
            onTap: () => PlaceholderPage.open(context,
                title: 'Cek Data',
                message: 'Cek data kamu lewat sini yaa :)',
                icon: Icons.verified_user_rounded),
          ),
          _InfoCard(
            text: 'Aktifkan OVO Score dan nikmati limit pinjaman spesial',
            button: 'Aktifkan',
            icon: const _ScoreIcon(),
            onTap: () => PlaceholderPage.open(context,
                title: 'OVO Score',
                message: 'Aktifkan OVO Score lewat sini yaa :)',
                icon: Icons.speed_rounded),
          ),
          _InfoCard(
            text: 'Hubungkan rekening bank kamu biar top up makin praktis',
            button: 'Hubungkan',
            icon: const _BankIcon(),
            onTap: () => PlaceholderPage.open(context,
                title: 'Rekening Bank',
                message: 'Hubungkan rekening lewat sini yaa :)',
                icon: Icons.account_balance_rounded),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.text,
    required this.button,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final String button;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 0, 14),
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2A1A5E).withValues(alpha: 0.07),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              const SizedBox(width: 14),
              Expanded(
                child: Padding(
                  // ruang di kanan supaya teks "tertutup" badge stamp
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    text,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                      height: 1.45,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 32,
              child: FilledButton(
                onPressed: onTap,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.ovoPurpleBright,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                ),
                child: Text(
                  button,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Ikon kunci ungu di atas blob kuning dengan kilau.
class _KeyIcon extends StatelessWidget {
  const _KeyIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            top: 10,
            child: Container(
              width: 40,
              height: 34,
              decoration: const BoxDecoration(
                color: Color(0xFFF7C948),
                borderRadius: BorderRadius.all(Radius.elliptical(40, 34)),
              ),
            ),
          ),
          // batang kunci
          Positioned(
            left: 17,
            top: 22,
            child: Container(
              width: 8,
              height: 20,
              decoration: BoxDecoration(
                color: const Color(0xFF5524C2),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Positioned(
            left: 23,
            top: 33,
            child: Container(width: 5, height: 3, color: const Color(0xFF5524C2)),
          ),
          // kepala kunci
          Positioned(
            left: 8,
            top: 0,
            child: Container(
              width: 26,
              height: 26,
              decoration: const BoxDecoration(
                color: Color(0xFF5B23C9),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.4),
                ),
              ),
            ),
          ),
          const Positioned(
            right: -2,
            top: 16,
            child: Icon(Icons.auto_awesome, size: 10, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _ScoreIcon extends StatelessWidget {
  const _ScoreIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: const BoxDecoration(
        color: Color(0xFFEDE6FB),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.speed_rounded, color: Color(0xFF5B23C9), size: 26),
    );
  }
}

class _BankIcon extends StatelessWidget {
  const _BankIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: const BoxDecoration(
        color: Color(0xFFFFF4DE),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.account_balance_rounded,
          color: Color(0xFFE5A50A), size: 24),
    );
  }
}

// ---------------------------------------------------------------------------
// Badge melayang "OVO STAMP - Mulai Misi!"
// ---------------------------------------------------------------------------

class StampBadge extends StatelessWidget {
  const StampBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => PlaceholderPage.open(context,
          title: 'OVO Stamp',
          message: 'Mulai misi OVO Stamp lewat sini yaa :)',
          icon: Icons.emoji_events_rounded),
      child: SizedBox(
        width: 84,
        height: 86,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            // Lingkaran latar
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFFFBF2),
                border: Border.all(color: const Color(0xFFF1EEF6), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            // Sinar kuning di belakang
            Positioned(
              top: 6,
              child: Container(
                width: 64,
                height: 50,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    colors: [Color(0xFFFFE3A3), Color(0x00FFE3A3)],
                  ),
                ),
              ),
            ),
            // Kotak hadiah ungu + koin
            Positioned(
              top: 40,
              child: Container(
                width: 34,
                height: 16,
                decoration: const BoxDecoration(
                  color: Color(0xFF5524C2),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(3)),
                ),
              ),
            ),
            Positioned(
              top: 36,
              left: 26,
              child: _coin(),
            ),
            Positioned(
              top: 37,
              right: 26,
              child: _coin(),
            ),
            // Bendera "OVO" ungu
            Positioned(
              top: 6,
              left: 30,
              child: Transform.rotate(
                angle: -0.12,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  color: const Color(0xFF4B17C9),
                  child: const OvoLogo(
                    fontSize: 9,
                    color: Colors.white,
                    backgroundColor: Color(0xFF4B17C9),
                  ),
                ),
              ),
            ),
            // Tulisan STAMP merah dengan outline putih
            Positioned(
              top: 20,
              child: Transform.rotate(
                angle: -0.05,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFFD7262B), width: 1.6),
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                  child: Stack(
                    children: [
                      Text(
                        'STAMP',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2.5
                            ..color = Colors.white,
                        ),
                      ),
                      const Text(
                        'STAMP',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                          color: Color(0xFFD7262B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Tombol hijau "Mulai Misi!"
            Positioned(
              top: 58,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.stampGreen,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: const Text(
                  'Mulai Misi!',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _coin() => Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Color(0xFFFFD36B), Color(0xFFE8A21A)],
          ),
          border: Border.all(color: const Color(0xFFD08A10), width: 0.8),
        ),
      );
}

// ---------------------------------------------------------------------------
// Banner promo bawah (EASYCASH x OVO dll)
// ---------------------------------------------------------------------------

class PromoBannerCarousel extends StatefulWidget {
  const PromoBannerCarousel({super.key});

  @override
  State<PromoBannerCarousel> createState() => _PromoBannerCarouselState();
}

class _PromoBannerCarouselState extends State<PromoBannerCarousel> {
  final _controller = PageController(viewportFraction: 0.86, initialPage: 1);
  int _page = 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final banners = <Widget>[
      const _GreenBanner(),
      const _EasyCashBanner(),
      const _PurpleBanner(),
    ];
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _controller,
            itemCount: banners.length,
            onPageChanged: (i) => setState(() => _page = i),
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () => PlaceholderPage.open(context,
                    title: 'Promo',
                    message: 'Cek promonya lewat sini yaa :)',
                    icon: Icons.local_offer_rounded),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: banners[i],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(banners.length, (i) {
            final active = i == _page;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: active ? 16 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: active ? AppColors.ovoPurpleBright : const Color(0xFFD9D6E2),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _EasyCashBanner extends StatelessWidget {
  const _EasyCashBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF1A0E2E), Color(0xFF221238), Color(0xFF3A2752)],
        ),
      ),
      child: Stack(
        children: [
          // garis-garis gedung di kanan
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 110,
            child: Row(
              children: List.generate(
                12,
                (i) => Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    color: Colors.white.withValues(alpha: 0.05 + (i % 3) * 0.03),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.sentiment_satisfied_rounded,
                              size: 13, color: Colors.white),
                          const SizedBox(width: 4),
                          const Text(
                            'EASYCASH  ×  ',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: 1.6,
                            ),
                          ),
                          const OvoLogo(
                            fontSize: 10,
                            color: Colors.white,
                            backgroundColor: Color(0xFF1E1032),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Stack(
                        children: [
                          Text(
                            'Cairkan Dana',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              height: 1,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 4
                                ..color = Colors.white,
                            ),
                          ),
                          const Text(
                            'Cairkan Dana',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              height: 1,
                              color: AppColors.easyCashGreen,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Pinjam hari ini, bebas biaya admin',
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                // mini "HP" dengan limit
                Container(
                  width: 92,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.easyCashGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          'Limit Pinjaman Hingga',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                        ),
                        SizedBox(height: 4),
                        FittedBox(
                          child: Text(
                            'Rp100.000.000',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GreenBanner extends StatelessWidget {
  const _GreenBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF8BC34A), Color(0xFF4E9A1E)],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Cashback s.d. 50%',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Belanja kebutuhan harian pakai OVO',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _PurpleBanner extends StatelessWidget {
  const _PurpleBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6A2BD9), Color(0xFF3B11A6)],
        ),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bayar pakai QRIS',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Dapetin OVO Points di semua merchant',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: Color(0xFF7ED957),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.qr_code_2_rounded,
                color: Colors.white, size: 30),
          ),
        ],
      ),
    );
  }
}
