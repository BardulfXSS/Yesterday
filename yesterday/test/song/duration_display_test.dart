import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/song/song.dart';
import 'package:yesterday/text/text.dart';

import '../test.dart';

void main() {
  testWidgets('displays minutes', (t) async {
    await t.pumpWidget(shell<String>(
      child: DurationDisplay(duration: Duration(minutes: 5)),
    ));

    expect(
      find.descendant(
        of: find.byType(BodyText),
        matching: find.text('5:00'),
      ),
      findsOneWidget,
    );
  });
  testWidgets('displays seconds', (t) async {
    await t.pumpWidget(shell<String>(
      child: DurationDisplay(duration: Duration(seconds: 50)),
    ));

    expect(
      find.descendant(
        of: find.byType(BodyText),
        matching: find.text('0:50'),
      ),
      findsOneWidget,
    );
  });
  testWidgets('displays seconds padded with 0s', (t) async {
    await t.pumpWidget(shell<String>(
      child: DurationDisplay(duration: Duration(seconds: 5)),
    ));

    expect(
      find.descendant(
        of: find.byType(BodyText),
        matching: find.text('0:05'),
      ),
      findsOneWidget,
    );
  });
}
