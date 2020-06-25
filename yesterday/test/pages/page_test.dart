import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/blocs/blocs.dart';
import 'package:yesterday/pages/pages.dart';

import '../test.dart';

void main() {
  testWidgets('navigates to login when login button pressed', (t) async {
    await t.pumpWidget(shell<String>(routes: {
      '/': (c) => Page<String>(
            child: Scaffold(
              body: RaisedButton(
                onPressed: () => BlocProvider.of<AuthenticationBloc<String>>(c)
                    .add(LoginButtonPressed()),
                child: Text('/'),
              ),
            ),
          ),
      'login': (c) => Scaffold(body: Text('login')),
    }));

    expect(find.text('/'), findsOneWidget);
    expect(find.text('login'), findsNothing);

    await t.tap(find.text('/'));
    await t.pumpAndSettle();

    expect(find.text('login'), findsOneWidget);
    expect(find.text('/'), findsNothing);
  });
}
