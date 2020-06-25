import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/blocs/blocs.dart';

Widget shell<T>({
  ThemeData theme,
  Map<String, WidgetBuilder> routes,
  Widget child,
}) =>
    BlocProvider<AuthenticationBloc<T>>(
      create: (ctx) => AuthenticationBloc<T>(),
      child: MaterialApp(
        theme: theme,
        routes: routes ?? {},
        home: child != null
            ? Scaffold(
                body: child,
              )
            : null,
      ),
    );

Finder findByType<T>(T unit) => find.byWidgetPredicate((w) => w is T);
