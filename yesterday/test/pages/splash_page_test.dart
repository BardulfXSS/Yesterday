import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/pages/pages.dart' show SplashPage;

import '../test.dart';

void main() => group('SplashPage', () {
      testWidgets('displays app name', (tester) async {
        await tester.pumpWidget(shell<String>(child: SplashPage()));
        expect(find.text('Yesterday'), findsOneWidget);
      });
      testWidgets('displays log in button', (tester) async {
        await tester.pumpWidget(shell<String>(child: SplashPage()));
        expect(
          find.descendant(
            of: findByType(NeumorphicButton(onPressed: () {})),
            matching: find.text('Log In'),
          ),
          findsOneWidget,
        );
      });
      group('when log in button pressed', () {
        testWidgets('changes to log in page', (tester) async {
          final key = GlobalKey();
          await tester.pumpWidget(shell<String>(routes: {
            '/': (ctx) => SplashPage(),
            'login': (ctx) => Scaffold(body: Placeholder(key: key)),
          }));
          await tester.tap(find.text('Log In'));
          await tester.pumpAndSettle();

          expect(find.byType(SplashPage), findsNothing);
          expect(find.byKey(key), findsOneWidget);
        });
        group('when back button pressed', () {
          testWidgets('goes back to splash screen', (t) async {
            await t.pumpWidget(shell<String>(routes: {
              '/': (c) => SplashPage(),
              'login': (c) => Scaffold(
                    body: RaisedButton(
                      onPressed: () => Navigator.pop(c),
                      child: Text('go back'),
                    ),
                  ),
            }));
            await t.tap(find.text('Log In'));
            await t.pumpAndSettle();
            await t.tap(find.text('go back'));
            await t.pumpAndSettle();

            expect(find.text('Log In'), findsOneWidget);
          });
          group('when log in button pressed again', () {
            testWidgets('goes back to login screen', (t) async {
              await t.pumpWidget(shell<String>(routes: {
                '/': (c) => SplashPage(),
                'login': (c) => Scaffold(
                      body: RaisedButton(
                        onPressed: () => Navigator.pop(c),
                        child: Text('go back'),
                      ),
                    ),
              }));
              await t.tap(find.text('Log In'));
              await t.pumpAndSettle();
              await t.tap(find.text('go back'));
              await t.pumpAndSettle();
              await t.tap(find.text('Log In'));
              await t.pumpAndSettle();

              expect(find.text('Log In'), findsNothing);
            });
          });
        });
      });
    });
