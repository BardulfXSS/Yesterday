import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/text/text.dart' show TitleText;

import '../test.dart';

void main() {
  ['foo', 'bar', 'baz', 'quux'].forEach(
    (text) => group('given $text', () {
      testWidgets('displays given text', (tester) async {
        await tester.pumpWidget(shell(child: TitleText(text)));
        expect(find.widgetWithText(TitleText, text), findsOneWidget);
      });

      [Colors.black, Colors.red, Colors.blue]
          .map((c) => TextStyle(color: c))
          .forEach(
            (style) => group('for headline style $style', () {
              testWidgets('formats as headline text', (tester) async {
                await tester.pumpWidget(shell(
                  theme: NeumorphicThemeData(
                    textTheme: TextTheme(headline4: style),
                  ),
                  child: TitleText(text),
                ));
                expect(
                  find.descendant(
                    of: find.byType(TitleText),
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
