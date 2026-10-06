import 'package:flutter/material.dart';

import '../widgets/ovo_bottom_nav.dart';
import '../widgets/placeholder_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

/// Halaman utama yang memegang bottom navigation.
/// Hanya tab Home dan Profile yang punya tampilan lengkap,
/// tab lain (Finance, Pay, Inbox) cuma membuka halaman placeholder.
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  void _onNavTap(int i) {
    switch (i) {
      case 0:
      case 4:
        setState(() => _index = i);
        break;
      case 1:
        PlaceholderPage.open(context,
            title: 'Finance',
            message: 'Atur keuangan kamu lewat sini yaa :)',
            icon: Icons.account_balance_wallet_rounded);
        break;
      case 2:
        PlaceholderPage.open(context,
            title: 'Pay',
            message: 'Bayar lewat sini yaa :)',
            icon: Icons.qr_code_scanner_rounded);
        break;
      case 3:
        PlaceholderPage.open(context,
            title: 'Inbox',
            message: 'Cek notifikasi kamu lewat sini yaa :)',
            icon: Icons.notifications_rounded);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody supaya konten terlihat di belakang tombol QRIS yang menonjol
      extendBody: true,
      body: IndexedStack(
        index: _index == 0 ? 0 : 1,
        children: const [HomePage(), ProfilePage()],
      ),
      bottomNavigationBar: OvoBottomNav(
        currentIndex: _index,
        onTap: _onNavTap,
      ),
    );
  }
}
