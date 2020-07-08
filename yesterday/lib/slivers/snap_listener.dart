import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SnapListener extends StatefulWidget {
  final Widget child;
  final ScrollController controller;

  SnapListener({Key key, @required this.child, @required this.controller})
      : super(key: key);

  @override
  _SnapListenerState createState() => _SnapListenerState();
}

class _SnapListenerState extends State<SnapListener> {
  ScrollPosition _position;

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_position != null)
      _position.isScrollingNotifier.removeListener(_isScrollingListener);
    _position = Scrollable.of(context)?.position;
    if (_position != null)
      _position.isScrollingNotifier.addListener(_isScrollingListener);
  }

  @override
  void dispose() {
    if (_position != null)
      _position.isScrollingNotifier.removeListener(_isScrollingListener);
    super.dispose();
  }

  RenderSliverFloatingPersistentHeader _headerRenderer() {
    return context
        .findAncestorRenderObjectOfType<RenderSliverFloatingPersistentHeader>();
  }

  void _isScrollingListener() {
    if (_position == null) return;

    // When a scroll stops, then maybe snap into view.
    // Similarly, when a scroll starts, then maybe stop the snap animation.
    final RenderSliverFloatingPersistentHeader header = _headerRenderer();
    if (_position.isScrollingNotifier.value)
      header?.maybeStopSnapAnimation(_position.userScrollDirection);
    else {
      final header = _headerRenderer();
      if (0 < _position.extentBefore &&
          _position.extentBefore < header.maxExtent) {
        if (_position.userScrollDirection == ScrollDirection.reverse) {
          widget.controller.animateTo(
            header.maxExtent,
            duration: header.snapConfiguration.duration,
            curve: header.snapConfiguration.curve,
          );
        } else if (_position.userScrollDirection == ScrollDirection.forward) {
          widget.controller.animateTo(
            0,
            duration: header.snapConfiguration.duration,
            curve: header.snapConfiguration.curve,
          );
        }
      } else {
        header?.maybeStartSnapAnimation(_position.userScrollDirection);
      }
    }
  }
}
