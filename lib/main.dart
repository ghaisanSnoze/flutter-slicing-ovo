import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/main_page.dart';
import 'theme/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const OvoApp());
}

class OvoApp extends StatelessWidget {
  const OvoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OVO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'PlusJakartaSans',
        scaffoldBackgroundColor: AppColors.sheetWhite,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.ovoPurple,
          primary: AppColors.ovoPurple,
        ),
        splashFactory: InkRipple.splashFactory,
      ),
      home: const MainPage(),
    );
  }
}
