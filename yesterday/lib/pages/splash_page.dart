import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yesterday/text/text.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
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
              child: RaisedButton(child: ButtonText('Log In')),
            ),
          )
        ],
      ),
    );
  }
}
