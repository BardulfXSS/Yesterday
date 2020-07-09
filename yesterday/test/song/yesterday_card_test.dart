import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/song/song.dart';
import 'package:yesterday/text/text.dart';

import '../test.dart';

void main() {
  testWidgets("has a variantColor background", (t) async {
    final color = Color(0xff123456);
    await t.pumpWidget(shell<String>(
      theme: NeumorphicThemeData(variantColor: color),
      child: YesterdayCard(
        child: BodyText('foo', dark: true),
      ),
    ));

    expect(
      t.widget<Neumorphic>(find.byType(Neumorphic)).style.color,
      color,
    );
  });
  testWidgets('displays child', (t) async {
    await t.pumpWidget(shell<String>(
      child: YesterdayCard(
        child: BodyText('foo', dark: true),
      ),
    ));

    expect(find.text('foo'), findsOneWidget);
  });
}
