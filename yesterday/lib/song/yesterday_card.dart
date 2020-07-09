import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:yesterday/main.dart';

class YesterdayCard extends StatelessWidget {
  final Widget child;
  final double dividerHeight;
  final double _dividerOpacity = 0.7;
  const YesterdayCard({Key key, @required this.child, this.dividerHeight = 3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: 0,
        boxShape: NeumorphicBoxShape.rect(),
        color: NeumorphicTheme.variantColor(context),
      ),
      child: Column(
        children: [
          Opacity(
            opacity: _dividerOpacity,
            child: Divider(
              height: dividerHeight,
              thickness: dividerHeight,
              color: AppTheme.primarySwatch.shade400,
            ),
          ),
          child,
          Opacity(
            opacity: _dividerOpacity,
            child: Divider(
              height: dividerHeight,
              thickness: dividerHeight,
              color: AppTheme.primarySwatch.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
