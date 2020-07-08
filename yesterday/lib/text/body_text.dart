import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:yesterday/text/text.dart';

class BodyText extends StatelessWidget {
  final String text;
  final bool dark;
  final TextStyle style;

  const BodyText(this.text,
      {Key key, this.dark = true, this.style = const TextStyle()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YesterdayText(
      text,
      dark: dark,
      style: (NeumorphicTheme.currentTheme(context).textTheme.bodyText2 ??
              TextStyle())
          .merge(style),
    );
  }
}
