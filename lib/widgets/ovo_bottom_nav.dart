import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Bottom nav OVO: Home, Finance, Pay (QRIS), Inbox, Profile.
class OvoBottomNav extends StatelessWidget {
  const OvoBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  /// 0 = Home, 1 = Finance, 2 = Pay, 3 = Inbox, 4 = Profile
  final int currentIndex;
  final ValueChanged<int> onTap;

  /// Tinggi area kosong di atas bar, buat tombol QRIS yang nongol.
  static const double raisedOverflow = 26;
  static const double barHeight = 68;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return SizedBox(
      height: raisedOverflow + barHeight + bottomInset,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Bar putih
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: barHeight + bottomInset,
            child: Container(
              padding: EdgeInsets.only(bottom: bottomInset),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 12,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  _NavItem(
                    label: 'Home',
                    selected: currentIndex == 0,
                    onTap: () => onTap(0),
                    icon: (c) => Icon(Icons.home_rounded, size: 28, color: c),
                  ),
                  _NavItem(
                    label: 'Finance',
                    selected: currentIndex == 1,
                    onTap: () => onTap(1),
                    icon: (c) => _RpIcon(color: c),
                  ),
                  // Tempat tombol QRIS + label "Pay"
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => onTap(2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Pay',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: currentIndex == 2
                                  ? FontWeight.w700
                                  : FontWeight.w600,
                              color: currentIndex == 2
                                  ? AppColors.ovoPurpleText
                                  : AppColors.textGrey,
                            ),
                          ),
                          const SizedBox(height: 9.5),
                        ],
                      ),
                    ),
                  ),
                  _NavItem(
                    label: 'Inbox',
                    selected: currentIndex == 3,
                    onTap: () => onTap(3),
                    icon: (c) => _InboxIcon(color: c, count: 36),
                  ),
                  _NavItem(
                    label: 'Profile',
                    selected: currentIndex == 4,
                    onTap: () => onTap(4),
                    icon: (c) =>
                        Icon(Icons.account_circle, size: 27, color: c),
                  ),
                ],
              ),
            ),
          ),

          // Tombol QRIS bulat yang nongol ke atas
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => onTap(2),
                child: Container(
                  width: 62,
                  height: 62,
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF8A33E6), Color(0xFF4B17C2)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF5B1FD1).withValues(alpha: 0.35),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const _QrisLogo(),
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

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.selected,
    required this.onTap,
    required this.icon,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Widget Function(Color color) icon;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.ovoPurpleBright : const Color(0xFF8C8C91);
    return Expanded(
      child: InkResponse(
        onTap: onTap,
        radius: 36,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30, child: Center(child: icon(color))),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                color: selected ? AppColors.ovoPurpleText : AppColors.textGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Ikon bulat tulisan "Rp".
class _RpIcon extends StatelessWidget {
  const _RpIcon({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: const Text(
        'Rp',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: Colors.white,
          height: 1,
        ),
      ),
    );
  }
}

/// Lonceng + badge merah jumlah notifikasi.
class _InboxIcon extends StatelessWidget {
  const _InboxIcon({required this.color, required this.count});
  final Color color;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 30,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Icon(Icons.notifications_rounded, size: 27, color: color),
          Positioned(
            top: -5,
            right: -4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              constraints: const BoxConstraints(minWidth: 18),
              decoration: BoxDecoration(
                color: AppColors.badgeRed,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white, width: 1.2),
              ),
              child: Text(
                '$count',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 9.5,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Tulisan "QRIS" + kotak QR kecil di depannya.
class _QrisLogo extends StatelessWidget {
  const _QrisLogo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 9,
          height: 11,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1.8),
            borderRadius: BorderRadius.circular(1),
          ),
          child: Center(
            child: Container(width: 2.5, height: 2.5, color: Colors.white),
          ),
        ),
        const SizedBox(width: 1),
        const Text(
          'RIS',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 0.2,
            height: 1,
          ),
        ),
      ],
    );
  }
}
