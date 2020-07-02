import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/text/text.dart' show LabelText;

import '../test.dart';

void main() {
  ['foo', 'bar', 'baz', 'quux'].forEach(
    (text) => group('given $text', () {
      testWidgets('displays given text', (tester) async {
        await tester.pumpWidget(shell<String>(child: LabelText(text)));
        expect(find.text(text), findsOneWidget);
      });
      [
        Colors.black,
        Colors.red,
        Colors.blue,
      ].map((c) => TextStyle(color: c)).forEach(
            (style) => group('for button style $style', () {
              testWidgets('formats as button text', (tester) async {
                await tester.pumpWidget(shell<String>(
                  theme: NeumorphicThemeData(
                    textTheme: TextTheme(button: style),
                  ),
                  child: LabelText(text),
                ));
                expect(
                  find.descendant(
                    of: find.byType(LabelText),
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
