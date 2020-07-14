import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yesterday/authentication_interceptor.dart';
import 'package:yesterday/blocs/blocs.dart';
import 'package:yesterday/pages/pages.dart';
import 'package:yesterday/services/authentication_service.dart';

void main() {
  runApp(RepositoryProvider<AuthenticationService<String>>(
    create: (_) => PlaceholderAuthenticationService((e, p) async => e),
    child: YesterdayApp<String>(),
  ));
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
          bodyText1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          subtitle2: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )),
        baseColor: baseColor,
        accentColor: accentColor,
        variantColor: primarySwatch.shade500,
        depth: 10,
      );
}

class YesterdayApp<T> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Causes following warning in tests:
    // Error loading AssetManifest.json, e: Unable to load asset: AssetManifest.json
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocProvider<AuthenticationBloc<T>>(
      create: (c) => AuthenticationBloc(),
      child: NeumorphicApp(
        title: 'Yesterday',
        theme: AppTheme.theme,
        routes: {
          '/': (ctx) => WillPopScope(
                onWillPop: () async => Navigator.canPop(ctx),
                child: AuthenticationInterceptor<T>(child: SplashPage()),
              ),
          'login': (_) => AuthenticationInterceptor<T>(child: LoginPage<T>()),
          'main': (ctx) => WillPopScope(
                onWillPop: () async => Navigator.canPop(ctx),
                child: AuthenticationInterceptor<T>(
                  child: MainPage<T>(),
                ),
              ),
          'view-playlist': (ctx) => AuthenticationInterceptor<T>(
                child: Scaffold(body: Placeholder()),
              ),
          'select-playlist-songs': (ctx) => AuthenticationInterceptor<T>(
                child: Scaffold(body: Placeholder()),
              ),
          'edit-playlist': (ctx) => AuthenticationInterceptor<T>(
                child: Scaffold(body: Placeholder()),
              ),
          'add-song': (ctx) => AuthenticationInterceptor<T>(
                child: Scaffold(body: Placeholder()),
              ),
          'add-metadata': (ctx) => AuthenticationInterceptor<T>(
                child: Scaffold(body: Placeholder()),
              ),
        },
      ),
    );
  }
}
