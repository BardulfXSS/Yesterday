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
            (style) => group('for bodyText1 style $style', () {
              testWidgets('formats as button text', (tester) async {
                await tester.pumpWidget(shell<String>(
                  theme: NeumorphicThemeData(
                    textTheme: TextTheme(bodyText1: style),
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
      testWidgets('displays white text if dark', (tester) async {
        await tester.pumpWidget(shell<String>(
          child: LabelText(text, dark: true),
        ));
        expect(
          find.descendant(
            of: find.byType(LabelText),
            matching: find.byWidgetPredicate(
                (w) => w is Text && w.style.color == Colors.white),
          ),
          findsOneWidget,
        );
      });
    }),
  );
}
