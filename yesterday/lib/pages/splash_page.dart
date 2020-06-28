import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart' hide Page;
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
                  Neumorphic(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Placeholder(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: TitleText("Yesterday"),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment(0, -1 / 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: NeumorphicButton(
                      onPressed: () => Navigator.pushNamed(context, 'login'),
                      child: ButtonText('Sign Up'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: NeumorphicButton(
                      onPressed: () => Navigator.pushNamed(context, 'login'),
                      child: ButtonText('Log In'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
