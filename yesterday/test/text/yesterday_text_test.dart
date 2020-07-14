import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/text/text.dart' show YesterdayText;

import '../test.dart';

void main() => group('YesterdayText', () {
      ['foo', 'bar', 'baz', 'quux'].forEach(
        (text) => group('given $text', () {
          testWidgets('displays given text', (tester) async {
            await tester.pumpWidget(shell<String>(child: YesterdayText(text)));
            expect(find.text(text), findsOneWidget);
          });
          [
            Colors.black,
            Colors.red,
            Colors.blue,
          ].map((c) => TextStyle(color: c)).forEach(
                (style) => group('for style $style', () {
                  testWidgets('formats according to style', (tester) async {
                    await tester.pumpWidget(shell<String>(
                      child: YesterdayText(text, style: style),
                    ));
                    expect(
                      find.descendant(
                        of: find.byType(YesterdayText),
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
              child: YesterdayText(text, dark: true),
            ));
            expect(
              find.descendant(
                of: find.byType(YesterdayText),
                matching: find.byWidgetPredicate(
                    (w) => w is Text && w.style.color == Colors.white),
              ),
              findsOneWidget,
            );
          });
        }),
      );
    });
