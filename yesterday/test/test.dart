import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget shell({ThemeData theme, Widget child}) => MaterialApp(
      theme: theme,
      home: Scaffold(
        body: child,
      ),
    );

Finder findByType<T>(T unit) => find.byWidgetPredicate((w) => w is T);
