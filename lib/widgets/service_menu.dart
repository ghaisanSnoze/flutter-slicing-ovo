import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'placeholder_page.dart';

/// Data buat satu menu layanan.
class ServiceItem {
  const ServiceItem({
    required this.label,
    required this.bgColor,
    required this.icon,
    this.badge,
  });

  final String label;
  final Color bgColor;
  final Widget icon;
  final String? badge;
}

/// Tab (Favorit, Finansial, Hiburan, Pilihan Lain) + grid menu layanan.
class ServiceMenu extends StatefulWidget {
  const ServiceMenu({super.key});

  @override
  State<ServiceMenu> createState() => _ServiceMenuState();
}

class _ServiceMenuState extends State<ServiceMenu> {
  static const _tabs = ['Favorit', 'Finansial', 'Hiburan', 'Pilihan Lain'];
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final items = _itemsFor(_selected);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tab
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: List.generate(_tabs.length, (i) {
              final selected = i == _selected;
              return GestureDetector(
                onTap: () => setState(() => _selected = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(right: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: selected ? AppColors.pillGrey : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _tabs[i],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: selected
                          ? AppColors.ovoPurpleText
                          : AppColors.textGreyLight,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 18),
        // Grid 4 kolom
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 104,
              crossAxisSpacing: 4,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, i) => _ServiceTile(item: items[i]),
          ),
        ),
      ],
    );
  }

  List<ServiceItem> _itemsFor(int tab) {
    switch (tab) {
      case 1:
        return _finansial;
      case 2:
        return _hiburan;
      case 3:
        return _pilihanLain;
      default:
        return _favorit;
    }
  }
}

class _ServiceTile extends StatelessWidget {
  const _ServiceTile({required this.item});
  final ServiceItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => PlaceholderPage.open(
        context,
        title: item.label,
        message: '${item.label} lewat sini yaa :)',
        icon: Icons.apps_rounded,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 58,
            width: 64,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 6,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: item.bgColor,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: item.icon,
                  ),
                ),
                if (item.badge != null)
                  Positioned(top: -1, child: _Badge(text: item.badge!)),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            item.label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

/// Label merah kecil (BARU, PROMO, 100JT, dll).
class _Badge extends StatelessWidget {
  const _Badge({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.badgeRed,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.badgeRed.withValues(alpha: 0.3),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w800,
          color: Colors.white,
          letterSpacing: 0.3,
          height: 1.2,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Ikon custom (digambar pakai widget, bukan file gambar)
// ---------------------------------------------------------------------------

/// Nabung by Superbank: donat ungu di atas mangkok tosca.
class _NabungIcon extends StatelessWidget {
  const _NabungIcon();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 26,
      height: 30,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: 24,
              height: 10,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2CC9B0), Color(0xFF17A796)],
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(3),
                  bottom: Radius.circular(6),
                ),
              ),
            ),
          ),
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF5B23C9), width: 6.5),
            ),
          ),
        ],
      ),
    );
  }
}

/// Pinjaman: kartu "Rp" ungu di atas tangan.
class _PinjamanIcon extends StatelessWidget {
  const _PinjamanIcon();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 22,
          height: 15,
          decoration: BoxDecoration(
            color: const Color(0xFF5B2FCF),
            borderRadius: BorderRadius.circular(2),
          ),
          alignment: Alignment.center,
          child: const Text(
            'Rp',
            style: TextStyle(
              fontSize: 8.5,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1,
            ),
          ),
        ),
        const SizedBox(height: 2),
        Transform.rotate(
          angle: -0.18,
          child: Container(
            width: 26,
            height: 7,
            decoration: const BoxDecoration(
              color: Color(0xFF6A2BD0),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
                top: Radius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Uang Elektronik: kartu oranye dengan gelombang contactless.
class _UangElektronikIcon extends StatelessWidget {
  const _UangElektronikIcon();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 24,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF26B45), Color(0xFFD9452A)],
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          const Positioned(
            top: 1,
            left: 0,
            right: 0,
            child: Icon(Icons.wifi_rounded, size: 15, color: Colors.white),
          ),
          Positioned(
            right: 3,
            bottom: 3,
            child: Container(
              width: 6,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFFFE08A),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Kotak rounded berwarna, isinya ikon putih.
class _BoxIcon extends StatelessWidget {
  const _BoxIcon({
    required this.icon,
    required this.colors,
    this.width = 24,
    this.height = 26,
    this.iconSize = 16,
  });

  final IconData icon;
  final List<Color> colors;
  final double width;
  final double height;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(icon, size: iconSize, color: Colors.white),
    );
  }
}

/// Ikon Material berwarna (tanpa kotak).
class _PlainIcon extends StatelessWidget {
  const _PlainIcon(this.icon, this.color, {this.size = 30});
  final IconData icon;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => Icon(icon, size: size, color: color);
}

// Warna background lingkaran
const _bgLavender = Color(0xFFEDE6FB);
const _bgPeach = Color(0xFFFFEEE4);
const _bgPink = Color(0xFFFDE4EE);
const _bgBlue = Color(0xFFE3ECFC);
const _bgCream = Color(0xFFFFF4DE);
const _bgCyan = Color(0xFFE0F3FD);
const _bgRed = Color(0xFFFDE7E4);
const _bgGreen = Color(0xFFE3F6E8);

const _favorit = <ServiceItem>[
  ServiceItem(
    label: 'Nabung by Superbank',
    bgColor: _bgLavender,
    badge: 'BARU',
    icon: _NabungIcon(),
  ),
  ServiceItem(
    label: 'Pinjaman',
    bgColor: _bgLavender,
    badge: '100JT',
    icon: _PinjamanIcon(),
  ),
  ServiceItem(
    label: 'Uang Elektronik',
    bgColor: _bgPeach,
    badge: 'Rp 1',
    icon: _UangElektronikIcon(),
  ),
  ServiceItem(
    label: 'Angsuran Kredit',
    bgColor: _bgPink,
    icon: _BoxIcon(
      icon: Icons.receipt_long_rounded,
      colors: [Color(0xFFF2408A), Color(0xFFD61C6B)],
    ),
  ),
  ServiceItem(
    label: 'Pulsa / Data',
    bgColor: _bgBlue,
    badge: 'PROMO',
    icon: _BoxIcon(
      icon: Icons.arrow_upward_rounded,
      colors: [Color(0xFF5B8DEF), Color(0xFF2F5FD6)],
      width: 18,
      height: 30,
    ),
  ),
  ServiceItem(
    label: 'Listrik PLN',
    bgColor: _bgCream,
    badge: 'PROMO',
    icon: _PlainIcon(Icons.bolt_rounded, Color(0xFFF7A31C), size: 34),
  ),
  ServiceItem(
    label: 'Air PDAM',
    bgColor: _bgCyan,
    icon: _PlainIcon(Icons.water_drop_rounded, Color(0xFF29ABF2)),
  ),
  ServiceItem(
    label: 'Internet & TV Kabel',
    bgColor: _bgRed,
    icon: _BoxIcon(
      icon: Icons.play_arrow_rounded,
      colors: [Color(0xFFF2533A), Color(0xFFD9301F)],
      width: 28,
      height: 22,
      iconSize: 18,
    ),
  ),
];

const _finansial = <ServiceItem>[
  ServiceItem(
    label: 'Nabung by Superbank',
    bgColor: _bgLavender,
    badge: 'BARU',
    icon: _NabungIcon(),
  ),
  ServiceItem(
    label: 'Pinjaman',
    bgColor: _bgLavender,
    badge: '100JT',
    icon: _PinjamanIcon(),
  ),
  ServiceItem(
    label: 'Angsuran Kredit',
    bgColor: _bgPink,
    icon: _BoxIcon(
      icon: Icons.receipt_long_rounded,
      colors: [Color(0xFFF2408A), Color(0xFFD61C6B)],
    ),
  ),
  ServiceItem(
    label: 'Investasi',
    bgColor: _bgGreen,
    icon: _PlainIcon(Icons.trending_up_rounded, Color(0xFF22A45D)),
  ),
  ServiceItem(
    label: 'Asuransi',
    bgColor: _bgBlue,
    icon: _PlainIcon(Icons.health_and_safety_rounded, Color(0xFF2F6BE0)),
  ),
  ServiceItem(
    label: 'Emas',
    bgColor: _bgCream,
    icon: _PlainIcon(Icons.diamond_rounded, Color(0xFFE5A50A)),
  ),
  ServiceItem(
    label: 'Kartu Kredit',
    bgColor: _bgPeach,
    icon: _PlainIcon(Icons.credit_card_rounded, Color(0xFFE5602E)),
  ),
  ServiceItem(
    label: 'Pajak',
    bgColor: _bgRed,
    icon: _PlainIcon(Icons.account_balance_rounded, Color(0xFFD9301F)),
  ),
];

const _hiburan = <ServiceItem>[
  ServiceItem(
    label: 'Voucher Game',
    bgColor: _bgLavender,
    badge: 'PROMO',
    icon: _PlainIcon(Icons.sports_esports_rounded, Color(0xFF5B23C9)),
  ),
  ServiceItem(
    label: 'Streaming',
    bgColor: _bgRed,
    icon: _BoxIcon(
      icon: Icons.play_arrow_rounded,
      colors: [Color(0xFFF2533A), Color(0xFFD9301F)],
      width: 28,
      height: 22,
      iconSize: 18,
    ),
  ),
  ServiceItem(
    label: 'Tiket Bioskop',
    bgColor: _bgCream,
    icon: _PlainIcon(Icons.movie_rounded, Color(0xFFF7A31C)),
  ),
  ServiceItem(
    label: 'Musik',
    bgColor: _bgGreen,
    icon: _PlainIcon(Icons.music_note_rounded, Color(0xFF22A45D)),
  ),
  ServiceItem(
    label: 'Tiket Event',
    bgColor: _bgPink,
    icon: _PlainIcon(Icons.confirmation_number_rounded, Color(0xFFD61C6B)),
  ),
  ServiceItem(
    label: 'Kode Voucher',
    bgColor: _bgBlue,
    icon: _PlainIcon(Icons.card_giftcard_rounded, Color(0xFF2F6BE0)),
  ),
];

const _pilihanLain = <ServiceItem>[
  ServiceItem(
    label: 'Pulsa / Data',
    bgColor: _bgBlue,
    badge: 'PROMO',
    icon: _BoxIcon(
      icon: Icons.arrow_upward_rounded,
      colors: [Color(0xFF5B8DEF), Color(0xFF2F5FD6)],
      width: 18,
      height: 30,
    ),
  ),
  ServiceItem(
    label: 'Listrik PLN',
    bgColor: _bgCream,
    badge: 'PROMO',
    icon: _PlainIcon(Icons.bolt_rounded, Color(0xFFF7A31C), size: 34),
  ),
  ServiceItem(
    label: 'Air PDAM',
    bgColor: _bgCyan,
    icon: _PlainIcon(Icons.water_drop_rounded, Color(0xFF29ABF2)),
  ),
  ServiceItem(
    label: 'BPJS',
    bgColor: _bgGreen,
    icon: _PlainIcon(Icons.local_hospital_rounded, Color(0xFF22A45D)),
  ),
  ServiceItem(
    label: 'Internet & TV Kabel',
    bgColor: _bgRed,
    icon: _BoxIcon(
      icon: Icons.play_arrow_rounded,
      colors: [Color(0xFFF2533A), Color(0xFFD9301F)],
      width: 28,
      height: 22,
      iconSize: 18,
    ),
  ),
  ServiceItem(
    label: 'Asuransi',
    bgColor: _bgBlue,
    icon: _PlainIcon(Icons.health_and_safety_rounded, Color(0xFF2F6BE0)),
  ),
  ServiceItem(
    label: 'Donasi',
    bgColor: _bgPink,
    icon: _PlainIcon(Icons.volunteer_activism_rounded, Color(0xFFD61C6B)),
  ),
  ServiceItem(
    label: 'Lihat Semua',
    bgColor: _bgLavender,
    icon: _PlainIcon(Icons.grid_view_rounded, Color(0xFF5B23C9), size: 26),
  ),
];
