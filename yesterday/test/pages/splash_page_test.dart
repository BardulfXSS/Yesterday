import 'package:flutter/material.dart' hide Page;
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/pages/pages.dart' show SplashPage, Page;

import '../test.dart';

void main() {
  testWidgets('displays app name', (tester) async {
    await tester.pumpWidget(shell<String>(child: SplashPage<String>()));
    expect(find.text('Yesterday'), findsOneWidget);
  });
  testWidgets('displays log in button', (tester) async {
    await tester.pumpWidget(shell<String>(child: SplashPage<String>()));
    expect(
      find.descendant(
        of: findByType(MaterialButton(onPressed: () {})),
        matching: find.text('Log In'),
      ),
      findsOneWidget,
    );
  });
  group('when log in button pressed', () {
    testWidgets('changes to log in page', (tester) async {
      await tester.pumpWidget(shell<String>(routes: {
        '/': (ctx) => SplashPage<String>(),
        'login': (ctx) => Page<String>(child: Placeholder()),
      }));
      await tester.tap(find.text('Log In'));
      await tester.pumpAndSettle();

      expect(find.byType(SplashPage), findsNothing);
    });
  });
}
