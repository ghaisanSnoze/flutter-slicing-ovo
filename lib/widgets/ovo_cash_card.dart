import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'ovo_logo.dart';
import 'placeholder_page.dart';

/// Kartu "OVO Cash" pakai gradient biru-ungu berlapis.
class OvoCashCard extends StatefulWidget {
  const OvoCashCard({super.key});

  @override
  State<OvoCashCard> createState() => _OvoCashCardState();
}

class _OvoCashCardState extends State<OvoCashCard> {
  bool _showBalance = false;

  void _toggle() => setState(() => _showBalance = !_showBalance);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B1E9E).withValues(alpha: 0.18),
            blurRadius: 16,
            spreadRadius: -4,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          children: [
            // Lapisan 1: gradient dasar
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF5354D6),
                      Color(0xFF4F44CC),
                      Color(0xFF5A26BF),
                      Color(0xFF4C3FC8),
                    ],
                    stops: [0, 0.35, 0.7, 1],
                  ),
                ),
              ),
            ),
            // Lapisan 2: "cahaya" biru di tengah atas
            const _Blob(
              alignment: Alignment(-0.05, -0.55),
              color: Color(0xFF4E86DA),
              radius: 0.75,
              opacity: 0.85,
            ),
            // Lapisan 3: gelombang biru di kiri bawah
            const _Blob(
              alignment: Alignment(-1.1, 1.0),
              color: Color(0xFF4B7FD9),
              radius: 0.7,
              opacity: 0.75,
            ),
            // Lapisan 4: ungu pekat di kanan atas
            const _Blob(
              alignment: Alignment(0.75, -0.9),
              color: Color(0xFF5E1CB8),
              radius: 0.75,
              opacity: 0.8,
            ),
            // Lapisan 5: ungu di kanan bawah
            const _Blob(
              alignment: Alignment(1.1, 0.9),
              color: Color(0xFF5A2AC6),
              radius: 0.6,
              opacity: 0.7,
            ),
            // Konten
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const OvoLogo(
                        fontSize: 16,
                        color: Colors.white,
                        backgroundColor: Color(0xFF5052D3),
                      ),
                      const SizedBox(width: 2),
                      const Text(
                        'Cash',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: _toggle,
                    child: Row(
                      children: [
                        const Text(
                          'Total Saldo',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          _showBalance
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          size: 15,
                          color: Colors.white.withValues(alpha: 0.75),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: _toggle,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            layoutBuilder: (current, previous) => Stack(
                              alignment: Alignment.centerLeft,
                              children: [...previous, ?current],
                            ),
                            child: Text(
                              _showBalance ? 'Rp1.250.000' : 'Tap untuk lihat',
                              key: ValueKey(_showBalance),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const _OvoPointsChip(),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      _CashAction(
                        label: 'Top Up',
                        icon: const _CircleIcon(icon: Icons.add_rounded),
                        onTap: () => PlaceholderPage.open(context,
                            title: 'Top Up',
                            message: 'Isi saldo lewat sini yaa :)',
                            icon: Icons.add_rounded),
                      ),
                      _CashAction(
                        label: 'Transfer',
                        icon: const _CircleIcon(
                            icon: Icons.arrow_upward_rounded),
                        onTap: () => PlaceholderPage.open(context,
                            title: 'Transfer',
                            message: 'Kirim uang lewat sini yaa :)',
                            icon: Icons.arrow_upward_rounded),
                      ),
                      _CashAction(
                        label: 'Tarik Tunai',
                        icon: const _TarikTunaiIcon(),
                        onTap: () => PlaceholderPage.open(context,
                            title: 'Tarik Tunai',
                            message: 'Tarik tunai lewat sini yaa :)',
                            icon: Icons.download_rounded),
                      ),
                      _CashAction(
                        label: 'History',
                        icon: const _HistoryIcon(),
                        onTap: () => PlaceholderPage.open(context,
                            title: 'History',
                            message: 'Lihat riwayat transaksi lewat sini yaa :)',
                            icon: Icons.receipt_long_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Blob warna lembut (radial gradient) buat efek gradient berlapis.
class _Blob extends StatelessWidget {
  const _Blob({
    required this.alignment,
    required this.color,
    required this.radius,
    required this.opacity,
  });

  final Alignment alignment;
  final Color color;
  final double radius;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: alignment,
            radius: radius,
            colors: [
              color.withValues(alpha: opacity),
              color.withValues(alpha: 0),
            ],
          ),
        ),
      ),
    );
  }
}

class _OvoPointsChip extends StatelessWidget {
  const _OvoPointsChip();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const StadiumBorder(),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: () => PlaceholderPage.open(context,
            title: 'OVO Points',
            message: 'Cek OVO Points kamu lewat sini yaa :)',
            icon: Icons.stars_rounded),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 8, 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                  color: Color(0xFF2E2B33),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'P',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'OVO Points',
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w800,
                  color: AppColors.ovoPurpleText,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right_rounded,
                  size: 18, color: AppColors.textDark),
            ],
          ),
        ),
      ),
    );
  }
}

class _CashAction extends StatelessWidget {
  const _CashAction({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            children: [
              SizedBox(height: 24, child: Center(child: icon)),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Lingkaran putih + ikon ungu kebiruan (Top Up & Transfer).
class _CircleIcon extends StatelessWidget {
  const _CircleIcon({required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 17, color: const Color(0xFF4F48C9)),
    );
  }
}

/// Ikon ATM putih + panah ke bawah.
class _TarikTunaiIcon extends StatelessWidget {
  const _TarikTunaiIcon();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 22,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // gagang atas
          Positioned(
            top: 0,
            child: Container(
              width: 22,
              height: 10,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(5)),
              ),
            ),
          ),
          // badan
          Container(
            width: 22,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
            ),
            child: const Icon(Icons.arrow_downward_rounded,
                size: 12, color: Color(0xFF4F48C9)),
          ),
        ],
      ),
    );
  }
}

/// Kotak putih rounded isi tiga garis (History).
class _HistoryIcon extends StatelessWidget {
  const _HistoryIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          3,
          (_) => Container(
            height: 2,
            decoration: BoxDecoration(
              color: const Color(0xFF4F48C9),
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ),
      ),
    );
  }
}
