import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';
import '../widgets/ovo_bottom_nav.dart';
import '../widgets/ovo_cash_card.dart';
import '../widgets/ovo_logo.dart';
import '../widgets/placeholder_page.dart';
import '../widgets/promo_widgets.dart';
import '../widgets/service_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// Seberapa tinggi sheet putih naik nutupin background lavender.
  static const double _sheetOverlap = 22;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // ikon putih (Android)
        statusBarBrightness: Brightness.dark, // ikon putih (iOS)
      ),
      child: ColoredBox(
        color: AppColors.sheetWhite,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              // ---------------- Bagian atas (lavender) ----------------
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFC4B8F2),
                      Color(0xFFC1B1EE),
                      Color(0xFFB7A3EA),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // kilau lembut di kanan atas
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            center: const Alignment(0.8, -0.7),
                            radius: 0.9,
                            colors: [
                              Colors.white.withValues(alpha: 0.18),
                              Colors.white.withValues(alpha: 0),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          16, topInset + 14, 16, 22 + _sheetOverlap),
                      child: const Column(
                        children: [
                          _Header(),
                          SizedBox(height: 18),
                          OvoCashCard(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ---------------- Sheet putih ----------------
              Transform.translate(
                offset: const Offset(0, -_sheetOverlap),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.sheetWhite,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 6),
                      const Stack(
                        clipBehavior: Clip.none,
                        children: [
                          InfoCardCarousel(),
                          Positioned(top: -12, right: 6, child: StampBadge()),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const ServiceMenu(),
                      const SizedBox(height: 20),
                      const PromoBannerCarousel(),
                      SizedBox(
                        height: OvoBottomNav.raisedOverflow +
                            OvoBottomNav.barHeight +
                            bottomInset,
                      ),
                    ],
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

/// Logo OVO di kiri + tombol "Promo" di kanan.
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const OvoLogo(
          fontSize: 30,
          color: Color(0xFF4A12C9),
          backgroundColor: Color(0xFFC3B6F1),
        ),
        const Spacer(),
        Material(
          color: Colors.white.withValues(alpha: 0.32),
          shape: const StadiumBorder(),
          child: InkWell(
            customBorder: const StadiumBorder(),
            onTap: () => PlaceholderPage.open(context,
                title: 'Promo',
                message: 'Cek promo lewat sini yaa :)',
                icon: Icons.discount_rounded),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(9, 6, 16, 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _PromoBadgeIcon(),
                  SizedBox(width: 8),
                  Text(
                    'Promo',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF4B17C9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Badge ungu bergerigi + tanda persen (ikon "Promo").
class _PromoBadgeIcon extends StatelessWidget {
  const _PromoBadgeIcon();

  @override
  Widget build(BuildContext context) {
    Widget square(double angle) => Transform.rotate(
          angle: angle,
          child: Container(
            width: 17,
            height: 17,
            decoration: BoxDecoration(
              color: const Color(0xFF4B17C9),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
    return SizedBox(
      width: 24,
      height: 24,
      child: Stack(
        alignment: Alignment.center,
        children: [
          square(0),
          square(0.785),
          const Icon(Icons.percent_rounded, size: 13, color: Colors.white),
        ],
      ),
    );
  }
}
