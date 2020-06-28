import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/blocs/blocs.dart';
import 'package:yesterday/pages/pages.dart';
import 'package:yesterday/text/text.dart';

import '../test.dart';

void main() {
  testWidgets('displays email text field', (t) async {
    await t.pumpWidget(shell<String>(child: LoginPage<String>()));
    expect(
      find.descendant(
        of: find.byType(YesterdayTextField),
        matching: find.text('Email'),
      ),
      findsOneWidget,
    );
  });
  testWidgets('displays password text field', (t) async {
    await t.pumpWidget(shell<String>(child: LoginPage<String>()));
    expect(
      find.descendant(
        of: find.byType(YesterdayTextField),
        matching: find.text('Password'),
      ),
      findsOneWidget,
    );
  });
  testWidgets('displays submit button', (t) async {
    await t.pumpWidget(shell<String>(child: LoginPage<String>()));
    expect(
      find.descendant(
        of: find.byType(NeumorphicButton),
        matching: find.byIcon(Icons.done),
      ),
      findsOneWidget,
    );
  });
  group('when enter pressed while email field focused', () {
    testWidgets('focuses password field', (t) async {
      await t.pumpWidget(shell<String>(child: LoginPage<String>()));

      await t.tap(find.descendant(
        of: find.ancestor(
          of: find.text('Email'),
          matching: find.byType(YesterdayTextField),
        ),
        matching: find.byType(TextField),
      ));
      await t.pumpAndSettle();
      await t.testTextInput.receiveAction(TextInputAction.done);
      await t.pumpAndSettle();
      t.testTextInput.enterText('foo');
      await t.pumpAndSettle();

      expect(
        find.descendant(
          of: find.ancestor(
            of: find.text('Password'),
            matching: find.byType(YesterdayTextField),
          ),
          matching: find.text('foo'),
        ),
        findsOneWidget,
      );
    });
  });
  group('when enter pressed while password field focused', () {
    testWidgets('submits email and password', (t) async {
      LoginEvent submittedEvent;
      await t.pumpWidget(shell<String>(
        child: LoginPage<String>(onSubmitted: (c, e) => submittedEvent = e),
      ));

      await t.enterText(
        find.descendant(
          of: find.ancestor(
            of: find.text('Email'),
            matching: find.byType(YesterdayTextField),
          ),
          matching: find.byType(TextField),
        ),
        'foo',
      );
      await t.pumpAndSettle();
      await t.tap(
        find.descendant(
          of: find.ancestor(
            of: find.text('Password'),
            matching: find.byType(YesterdayTextField),
          ),
          matching: find.byType(TextField),
        ),
      );
      await t.pumpAndSettle();
      t.testTextInput.enterText('bar');
      await t.pumpAndSettle();
      await t.testTextInput.receiveAction(TextInputAction.done);
      await t.pumpAndSettle();

      expect(
        submittedEvent,
        LoginWithEmailPassword((b) => b
          ..email = 'foo'
          ..password = 'bar'),
      );
    });
  });
  group('when fab pressed', () {
    testWidgets('submits email and password', (t) async {
      LoginEvent submittedEvent;
      await t.pumpWidget(shell<String>(
        child: LoginPage<String>(onSubmitted: (c, e) => submittedEvent = e),
      ));

      await t.enterText(
        find.descendant(
          of: find.ancestor(
            of: find.text('Email'),
            matching: find.byType(YesterdayTextField),
          ),
          matching: find.byType(TextField),
        ),
        'foo',
      );
      await t.pumpAndSettle();
      await t.enterText(
        find.descendant(
          of: find.ancestor(
            of: find.text('Password'),
            matching: find.byType(YesterdayTextField),
          ),
          matching: find.byType(TextField),
        ),
        'bar',
      );
      await t.pumpAndSettle();
      await t.tap(find.byIcon(Icons.done));
      await t.pumpAndSettle();

      expect(
        submittedEvent,
        LoginWithEmailPassword((b) => b
          ..email = 'foo'
          ..password = 'bar'),
      );
    });
  });
}
