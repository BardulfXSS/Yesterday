import 'package:flutter/material.dart' hide Page;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yesterday/blocs/authentication.dart';
import 'package:yesterday/pages/pages.dart';

void main() {
  runApp(MyApp<String>());
}

class MyApp<T> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
    ]);
    return BlocProvider(
      create: (context) => AuthenticationBloc<String>(),
      child: MaterialApp(
        title: 'Yesterday',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (ctx) => SplashPage<T>(),
          'login': (ctx) => Page<T>(child: Scaffold(body: Placeholder())),
          'main': (ctx) => Page<T>(child: Scaffold(body: Placeholder())),
          'view-playlist': (ctx) =>
              Page<T>(child: Scaffold(body: Placeholder())),
          'select-playlist-songs': (ctx) => Page<T>(
                child: Scaffold(body: Placeholder()),
              ),
          'edit-playlist': (ctx) =>
              Page<T>(child: Scaffold(body: Placeholder())),
          'add-song': (ctx) => Page<T>(child: Scaffold(body: Placeholder())),
          'add-metadata': (ctx) =>
              Page<T>(child: Scaffold(body: Placeholder())),
        },
      ),
    );
  }
}
