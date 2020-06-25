import 'package:flutter/material.dart' hide Page;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yesterday/blocs/blocs.dart';
import 'package:yesterday/pages/pages.dart';
import 'package:yesterday/text/text.dart';

class SplashPage<T> extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Page<T>(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Placeholder(),
                    ),
                    TitleText("Yesterday"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment(0, -1 / 2),
                child: RaisedButton(
                  onPressed: () =>
                      BlocProvider.of<AuthenticationBloc<T>>(context)
                          .add(LoginButtonPressed()),
                  child: ButtonText('Log In'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
