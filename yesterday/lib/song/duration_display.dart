import 'package:flutter/widgets.dart';
import 'package:yesterday/text/text.dart';

class DurationDisplay extends StatelessWidget {
  final Duration duration;
  String get minutes => duration.inMinutes.toString();
  String get seconds => (duration.inSeconds % Duration.secondsPerMinute)
      .toString()
      .padLeft(2, '0');

  const DurationDisplay({Key key, @required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: BodyText('$minutes:$seconds'),
      ),
    );
  }
}
