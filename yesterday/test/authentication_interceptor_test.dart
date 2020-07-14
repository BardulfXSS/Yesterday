import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:yesterday/authentication_interceptor.dart';
import 'package:yesterday/blocs/authentication_bloc.dart';

import 'test.dart';

void main() => group('AuthenticationInterceptor', () {
      group('on authenticated', () {
        testWidgets('navigates to route main', (t) async {
          final bloc = AuthenticationBloc<String>();
          await t.pumpWidget(shell<String>(
            bloc: (_) => bloc,
            routes: {
              '/': (_) =>
                  AuthenticationInterceptor<String>(child: Placeholder()),
              'main': (_) => Text('foo'),
            },
          ));
          bloc.add(UserLoggedIn((b) => b.user = 'foo'));
          await t.pumpAndSettle();
          bloc.close();

          expect(find.text('foo'), findsOneWidget);
        });
      });
      group('on unauthenticated', () {
        testWidgets('navigates to route main', (t) async {
          final bloc = AuthenticationBloc<String>();
          await t.pumpWidget(shell<String>(
            bloc: (_) => bloc,
            routes: {
              '/': (_) => AuthenticationInterceptor<String>(child: Text('bar')),
              'main': (_) =>
                  AuthenticationInterceptor<String>(child: Text('foo')),
            },
          ));
          bloc.add(UserLoggedIn((b) => b.user = 'foo'));
          await t.pumpAndSettle();
          bloc.add(UserLoggedOut());
          await t.pumpAndSettle();
          bloc.close();

          expect(find.text('bar'), findsOneWidget);
        });
      });
      testWidgets('provides user to children', (t) async {
        final bloc = AuthenticationBloc<String>();
        await t.pumpWidget(shell<String>(
          bloc: (_) => bloc,
          routes: {
            '/': (c) => AuthenticationInterceptor<String>(child: Placeholder()),
            'main': (_) => AuthenticationInterceptor<String>(
                  child: Consumer<String>(builder: (c, user, _) => Text(user)),
                ),
          },
        ));
        bloc.add(UserLoggedIn((b) => b.user = 'foo'));
        await t.pumpAndSettle();
        bloc.close();

        expect(find.text('foo'), findsOneWidget);
      });
    });
