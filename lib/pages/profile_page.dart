import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';
import '../widgets/ovo_bottom_nav.dart';
import '../widgets/placeholder_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    final bottomInset = MediaQuery.of(context).padding.bottom;

    void open(String title, IconData icon, [String? message]) =>
        PlaceholderPage.open(context,
            title: title, icon: icon, message: message);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: ColoredBox(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.only(
            top: topInset + 8,
            bottom: OvoBottomNav.raisedOverflow +
                OvoBottomNav.barHeight +
                bottomInset +
                8,
          ),
          children: [
            // Tombol pengaturan kecil di kanan atas
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(6),
                  onTap: () => open('Pengaturan', Icons.settings_rounded,
                      'Atur aplikasi lewat sini yaa :)'),
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE4E3E8),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(Icons.settings_rounded,
                        size: 16, color: Color(0xFF9C9BA3)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Judul
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Info user
            InkWell(
              onTap: () => open('Ubah Profil', Icons.person_rounded,
                  'Ubah profil kamu lewat sini yaa :)'),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(
                        color: Color(0xFFDADADF),
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: const Icon(Icons.person_rounded,
                          size: 40, color: Color(0xFFF7F7F9)),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ghaisan Apip',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textDark,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '08XXXXXXXXXX',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Menu OVO
            _MenuTile(
              icon: Icons.workspace_premium_outlined,
              label: 'OVO Premier',
              showChevron: false,
              onTap: () => open('OVO Premier', Icons.workspace_premium_rounded),
            ),
            _MenuTile(
              icon: Icons.speed_rounded,
              label: 'OVO Score',
              showChevron: false,
              badge: 'NEW',
              trailing: _PillButton(
                label: 'Aktifkan',
                onTap: () => open('OVO Score', Icons.speed_rounded,
                    'Aktifkan OVO Score lewat sini yaa :)'),
              ),
              onTap: () => open('OVO Score', Icons.speed_rounded),
            ),
            _MenuTile(
              icon: Icons.radio_button_checked_rounded,
              label: 'OVO Stamp',
              showChevron: false,
              onTap: () => open('OVO Stamp', Icons.emoji_events_rounded,
                  'Kumpulin stamp lewat sini yaa :)'),
            ),

            const _SectionDivider(),

            // OVO ID
            const _SectionTitle('OVO ID'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _OutlineButton(
                      icon: const Icon(Icons.qr_code_2_rounded,
                          size: 20, color: AppColors.textDark),
                      label: 'QR Code',
                      onTap: () => open('QR Code', Icons.qr_code_2_rounded,
                          'Tunjukin QR Code kamu lewat sini yaa :)'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _OutlineButton(
                      icon: const _BarcodeIcon(),
                      label: 'Barcode',
                      onTap: () => open('Barcode', Icons.view_week_rounded,
                          'Tunjukin Barcode kamu lewat sini yaa :)'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            const _SectionDivider(),

            // Akun
            const _SectionTitle('Akun'),
            _MenuTile(
              icon: Icons.manage_accounts_outlined,
              label: 'Ubah Profil',
              onTap: () => open('Ubah Profil', Icons.person_rounded,
                  'Ubah profil kamu lewat sini yaa :)'),
            ),
            _MenuTile(
              icon: Icons.credit_card_rounded,
              label: 'My Cards',
              onTap: () => open('My Cards', Icons.credit_card_rounded,
                  'Kelola kartu kamu lewat sini yaa :)'),
            ),
            _MenuTile(
              icon: Icons.account_balance_outlined,
              label: 'Rekening Bank',
              onTap: () => open('Rekening Bank', Icons.account_balance_rounded,
                  'Hubungkan rekening lewat sini yaa :)'),
            ),
            _MenuTile(
              icon: Icons.lock_outline_rounded,
              label: 'Keamanan',
              onTap: () => open('Keamanan', Icons.lock_rounded,
                  'Atur keamanan akun lewat sini yaa :)'),
            ),
            _MenuTile(
              icon: Icons.notifications_none_rounded,
              label: 'Notifikasi',
              onTap: () => open('Notifikasi', Icons.notifications_rounded,
                  'Atur notifikasi lewat sini yaa :)'),
            ),

            const _SectionDivider(),

            // Tentang
            const _SectionTitle('Tentang'),
            _MenuTile(
              icon: Icons.help_outline_rounded,
              label: 'Pusat Bantuan',
              onTap: () => open('Pusat Bantuan', Icons.support_agent_rounded,
                  'Tanya-tanya lewat sini yaa :)'),
            ),
            _MenuTile(
              icon: Icons.description_outlined,
              label: 'Syarat dan Ketentuan',
              onTap: () => open('Syarat dan Ketentuan',
                  Icons.description_rounded, 'Baca S&K lewat sini yaa :)'),
            ),
            _MenuTile(
              icon: Icons.privacy_tip_outlined,
              label: 'Kebijakan Privasi',
              onTap: () => open('Kebijakan Privasi', Icons.privacy_tip_rounded,
                  'Baca kebijakan privasi lewat sini yaa :)'),
            ),
            _MenuTile(
              icon: Icons.logout_rounded,
              label: 'Keluar',
              color: AppColors.badgeRed,
              showChevron: false,
              onTap: () => open('Keluar', Icons.logout_rounded,
                  'Yakin mau keluar? Belum bisa kok hehe :)'),
            ),
            const SizedBox(height: 12),
            const Center(
              child: Text(
                'Versi 1.0.0',
                style: TextStyle(fontSize: 12, color: AppColors.textGreyLight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.trailing,
    this.badge,
    this.showChevron = true,
    this.color = AppColors.textDark,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Widget? trailing;
  final String? badge;
  final bool showChevron;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon,
                size: 20,
                color: color == AppColors.textDark
                    ? const Color(0xFF6E6D75)
                    : color),
            const SizedBox(width: 14),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
            if (badge != null) ...[
              const SizedBox(width: 4),
              Transform.translate(
                offset: const Offset(0, -6),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  decoration: BoxDecoration(
                    color: AppColors.badgeRed,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    badge!,
                    style: const TextStyle(
                      fontSize: 7.5,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
            const Spacer(),
            ?trailing,
            if (showChevron)
              const Icon(Icons.chevron_right_rounded,
                  size: 22, color: Color(0xFFB4B3BA)),
          ],
        ),
      ),
    );
  }
}

class _PillButton extends StatelessWidget {
  const _PillButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: FilledButton(
        onPressed: onTap,
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFF4B2BB8),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  const _OutlineButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final Widget icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFFE2E1E7)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: SizedBox(
          height: 46,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Ikon barcode simpel dari garis-garis.
class _BarcodeIcon extends StatelessWidget {
  const _BarcodeIcon();

  static const _widths = [2.0, 1.0, 2.5, 1.0, 1.0, 2.5, 1.0, 2.0, 1.0];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final w in _widths) ...[
            Container(width: w, color: AppColors.textDark),
            const SizedBox(width: 1),
          ],
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w800,
          color: AppColors.textDark,
        ),
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      margin: const EdgeInsets.only(top: 6),
      color: AppColors.divider,
    );
  }
}
