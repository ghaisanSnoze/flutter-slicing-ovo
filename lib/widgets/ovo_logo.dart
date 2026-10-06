import 'package:flutter/material.dart';

/// Logo "OVO" bergaya outline garis ganda seperti di aplikasi asli.
/// Caranya: teks di-stroke tebal, lalu di-stroke tipis lagi pakai warna
/// background tepat di tengahnya, jadi kelihatan seperti dua garis.
class OvoLogo extends StatelessWidget {
  const OvoLogo({
    super.key,
    this.fontSize = 34,
    this.color = const Color(0xFF4A12C9),
    required this.backgroundColor,
  });

  final double fontSize;
  final Color color;

  /// Warna di belakang logo, dipakai untuk "membelah" garis.
  final Color backgroundColor;

  TextStyle _stroke(double width, Color c) => TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        letterSpacing: fontSize * 0.04,
        height: 1,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = width
          ..strokeJoin = StrokeJoin.round
          ..color = c,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(fontSize * 0.07),
      child: Stack(
        children: [
          Text('OVO', style: _stroke(fontSize * 0.14, color)),
          Text('OVO', style: _stroke(fontSize * 0.045, backgroundColor)),
        ],
      ),
    );
  }
}
