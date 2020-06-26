import 'package:flutter/material.dart' hide Page;
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart' hide Page;
import 'package:google_fonts/google_fonts.dart';
import 'package:yesterday/pages/pages.dart';

void main() {
  runApp(MyApp<String>());
}

class AppTheme {
  static const baseColor = Color(0xffe0e0ec);
  static const accentColor = Color(0xff2421e2);
  static const primarySwatch = MaterialColor(
    0xff2421e2,
    <int, Color>{
      900: Color(0xff000ad6),
      800: Color(0xff001bdc),
      700: Color(0xff2421e2),
      600: Color(0xff4229ea),
      500: Color(0xff512df1),
      400: Color(0xff7450f4),
      300: Color(0xff9171f6),
      200: Color(0xffb39bf8),
      100: Color(0xffd2c3fa),
      50: Color(0xffeee7fd),
    },
  );

  static NeumorphicThemeData get theme => NeumorphicThemeData(
        textTheme: GoogleFonts.varelaRoundTextTheme(TextTheme(
          headline4: TextStyle(
            color: accentColor,
            fontWeight: FontWeight.w900,
          ),
          button: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )),
        baseColor: baseColor,
        accentColor: accentColor,
        depth: 10,
      );
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
    return NeumorphicApp(
      title: 'Yesterday',
      theme: AppTheme.theme,
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
