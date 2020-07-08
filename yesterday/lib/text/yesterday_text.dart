import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class YesterdayText extends StatelessWidget {
  final String text;
  final bool dark;
  final TextStyle style;

  const YesterdayText(
    this.text, {
    Key key,
    this.dark = false,
    this.style = const TextStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: dark ? Colors.white : null,
        ).merge(style));
  }
}
