import 'package:flutter/widgets.dart';

// TODO: Someday test that the default overscroll glow indicator doesn't show
class YesterdayScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
          BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;
}
