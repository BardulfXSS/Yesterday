import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
      [
        Colors.black,
        Colors.red,
        Colors.blue,
      ].map((c) => TextStyle(color: c)).forEach(
            (style) => group('for button style $style', () {
              testWidgets('formats as button text', (tester) async {
                await tester.pumpWidget(shell(
                  theme: NeumorphicThemeData(
                    textTheme: TextTheme(button: style),
                  ),
                  child: ButtonText(text),
                ));
                expect(
                  find.descendant(
                    of: find.byType(ButtonText),
                    matching: find.byWidgetPredicate((w) =>
                        w is Text &&
                        w.style.merge(style).compareTo(w.style) ==
                            RenderComparison.identical),
                  ),
                  findsOneWidget,
                );
              });
            }),
          );
    }),
  );
}
