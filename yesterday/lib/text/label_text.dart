import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:yesterday/text/text.dart';

class LabelText extends StatelessWidget {
  final String text;
  final bool dark;
  final TextStyle style;
  const LabelText(
    this.text, {
    Key key,
    this.dark = false,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YesterdayText(
      text,
      dark: dark,
      style: (NeumorphicTheme.currentTheme(context).textTheme.bodyText1 ??
              TextStyle())
          .merge(style),
    );
  }
}
