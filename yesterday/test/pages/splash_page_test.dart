import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/pages/pages.dart' show SplashPage;

import '../test.dart';

void main() {
  testWidgets('displays app name', (tester) async {
    await tester.pumpWidget(shell(child: SplashPage()));
    expect(find.text('Yesterday'), findsOneWidget);
  });
  testWidgets('displays log in button', (tester) async {
    await tester.pumpWidget(shell(child: SplashPage()));
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
      await tester.pumpWidget(shell(child: SplashPage()));
      await tester.tap(find.text('Log In'));
      await tester.pumpAndSettle();

      expect(find.byType(SplashPage), findsNothing);
    });
  });
}
