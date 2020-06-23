import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yesterday/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'Yesterday',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (ctx) => SplashPage(),
        'login': (ctx) => Scaffold(body: Placeholder()),
        'main': (ctx) => Scaffold(body: Placeholder()),
        'view-playlist': (ctx) => Scaffold(body: Placeholder()),
        'select-playlist-songs': (ctx) => Scaffold(body: Placeholder()),
        'edit-playlist': (ctx) => Scaffold(body: Placeholder()),
        'add-song': (ctx) => Scaffold(body: Placeholder()),
        'add-metadata': (ctx) => Scaffold(body: Placeholder()),
      },
    );
  }
}
