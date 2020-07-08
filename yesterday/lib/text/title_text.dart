import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:yesterday/text/text.dart';

class TitleText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const TitleText(this.text, {Key key, this.style = const TextStyle()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: YesterdayText(
        text,
        style: (NeumorphicTheme.currentTheme(context).textTheme.headline4 ??
                TextStyle())
            .merge(style),
      ),
    );
  }
}
