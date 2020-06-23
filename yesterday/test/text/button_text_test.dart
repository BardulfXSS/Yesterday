import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/text/text.dart' show ButtonText;

import '../test.dart';

void main() {
  ['foo', 'bar', 'baz', 'quux'].forEach(
    (text) => group('given $text', () {
      testWidgets('displays given text', (tester) async {
        await tester.pumpWidget(shell(child: ButtonText(text)));
        expect(find.text(text), findsOneWidget);
      });
    }),
  );
}
