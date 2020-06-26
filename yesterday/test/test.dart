import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_test/flutter_test.dart';

Widget shell<T>({
  NeumorphicThemeData theme,
  Map<String, WidgetBuilder> routes,
  Widget child,
}) =>
    NeumorphicApp(
      theme: theme ?? NeumorphicThemeData(),
      routes: routes ?? {},
      home: child != null
          ? Scaffold(
              body: child,
            )
          : null,
    );

Finder findByType<T>(T unit) => find.byWidgetPredicate((w) => w is T);
