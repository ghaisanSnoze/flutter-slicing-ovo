import 'package:flutter_test/flutter_test.dart';

import 'package:slicing_ovo/main.dart';

void main() {
  testWidgets('Home tampil dan bisa pindah ke Profile', (tester) async {
    await tester.pumpWidget(const OvoApp());
    expect(find.text('Tap untuk lihat'), findsOneWidget);
    expect(find.text('OVO Points'), findsOneWidget);

    await tester.tap(find.text('Profile').last);
    await tester.pumpAndSettle();
    expect(find.text('Dian'), findsOneWidget);
    expect(find.text('OVO Stamp'), findsOneWidget);
  });

  testWidgets('Tombol Pay buka halaman placeholder', (tester) async {
    await tester.pumpWidget(const OvoApp());
    await tester.tap(find.text('Pay'));
    await tester.pumpAndSettle();
    expect(find.text('Bayar lewat sini yaa :)'), findsOneWidget);
  });
}
