import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// The only custom code is in here
mixin _RenderSliverShrinkWrappedPersistentHeaderForWidgetsMixin
    on RenderSliverPersistentHeader {
  _SliverShrinkWrappedPersistentHeaderElement _element;
  double _maxExtent = double.infinity;

  @override
  double get minExtent => _element.widget.delegate.minExtent;

  @override
  double get maxExtent => math.max(
      minExtent, math.min(_element.widget.delegate.maxExtent, _maxExtent));

  @override
  void updateChild(double shrinkOffset, bool overlapsContent) {
    assert(_element != null);
    _element._build(shrinkOffset, overlapsContent);
  }

  @override
  void performLayout() {
    layoutChild(0, double.infinity);
    _maxExtent = childExtent;
    super.performLayout();
  }

  @protected
  void triggerRebuild() {
    markNeedsLayout();
  }
}

// The rest of this file is just copy-pasted
// This is necessary since all of the implementation classes are package-private
class SliverShrinkWrappedPersistentHeader extends SliverPersistentHeader {
  const SliverShrinkWrappedPersistentHeader({
    Key key,
    @required delegate,
    pinned = false,
    floating = false,
  }) : super(key: key, delegate: delegate, pinned: pinned, floating: floating);

  @override
  Widget build(BuildContext context) {
    if (floating && pinned)
      return _SliverShrinkWrappedFloatingPinnedPersistentHeader(
          delegate: delegate);
    if (pinned)
      return _SliverShrinkWrappedPinnedPersistentHeader(delegate: delegate);
    if (floating)
      return _SliverShrinkWrappedFloatingPersistentHeader(delegate: delegate);
    return _SliverShrinkWrappedScrollingPersistentHeader(delegate: delegate);
  }
}

class _SliverShrinkWrappedPersistentHeaderElement extends RenderObjectElement {
  _SliverShrinkWrappedPersistentHeaderElement(
      _SliverShrinkWrappedPersistentHeaderRenderObjectWidget widget)
      : super(widget);

  @override
  _SliverShrinkWrappedPersistentHeaderRenderObjectWidget get widget =>
      super.widget as _SliverShrinkWrappedPersistentHeaderRenderObjectWidget;

  @override
  _RenderSliverShrinkWrappedPersistentHeaderForWidgetsMixin get renderObject =>
      super.renderObject
          as _RenderSliverShrinkWrappedPersistentHeaderForWidgetsMixin;

  @override
  void mount(Element parent, dynamic newSlot) {
    super.mount(parent, newSlot);
    renderObject._element = this;
  }

  @override
  void unmount() {
    super.unmount();
    renderObject._element = null;
  }

  @override
  void update(
      _SliverShrinkWrappedPersistentHeaderRenderObjectWidget newWidget) {
    final _SliverShrinkWrappedPersistentHeaderRenderObjectWidget oldWidget =
        widget;
    super.update(newWidget);
    final SliverPersistentHeaderDelegate newDelegate = newWidget.delegate;
    final SliverPersistentHeaderDelegate oldDelegate = oldWidget.delegate;
    if (newDelegate != oldDelegate &&
        (newDelegate.runtimeType != oldDelegate.runtimeType ||
            newDelegate.shouldRebuild(oldDelegate)))
      renderObject.triggerRebuild();
  }

  @override
  void performRebuild() {
    super.performRebuild();
    renderObject.triggerRebuild();
  }

  Element child;

  void _build(double shrinkOffset, bool overlapsContent) {
    owner.buildScope(this, () {
      child = updateChild(
        child,
        widget.delegate.build(this, shrinkOffset, overlapsContent),
        null,
      );
    });
  }

  @override
  void forgetChild(Element child) {
    assert(child == this.child);
    this.child = null;
    super.forgetChild(child);
  }

  @override
  void insertChildRenderObject(covariant RenderBox child, dynamic slot) {
    assert(renderObject.debugValidateChild(child));
    renderObject.child = child;
  }

  @override
  void moveChildRenderObject(covariant RenderObject child, dynamic slot) {
    assert(false);
  }

  @override
  void removeChildRenderObject(covariant RenderObject child) {
    renderObject.child = null;
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    if (child != null) visitor(child);
  }
}

abstract class _SliverShrinkWrappedPersistentHeaderRenderObjectWidget
    extends RenderObjectWidget {
  const _SliverShrinkWrappedPersistentHeaderRenderObjectWidget({
    Key key,
    @required this.delegate,
  })  : assert(delegate != null),
        super(key: key);

  final SliverPersistentHeaderDelegate delegate;

  @override
  _SliverShrinkWrappedPersistentHeaderElement createElement() =>
      _SliverShrinkWrappedPersistentHeaderElement(this);

  @override
  _RenderSliverShrinkWrappedPersistentHeaderForWidgetsMixin createRenderObject(
      BuildContext context);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<SliverPersistentHeaderDelegate>(
      'delegate',
      delegate,
    ));
  }
}

class _SliverShrinkWrappedScrollingPersistentHeader
    extends _SliverShrinkWrappedPersistentHeaderRenderObjectWidget {
  const _SliverShrinkWrappedScrollingPersistentHeader({
    Key key,
    @required SliverPersistentHeaderDelegate delegate,
  }) : super(
          key: key,
          delegate: delegate,
        );

  @override
  _RenderSliverShrinkWrappedPersistentHeaderForWidgetsMixin createRenderObject(
      BuildContext context) {
    return _RenderSliverShrinkWrappedScrollingPersistentHeaderForWidgets(
        stretchConfiguration: delegate.stretchConfiguration);
  }
}

class _SliverShrinkWrappedPinnedPersistentHeader
    extends _SliverShrinkWrappedPersistentHeaderRenderObjectWidget {
  const _SliverShrinkWrappedPinnedPersistentHeader({
    Key key,
    @required SliverPersistentHeaderDelegate delegate,
  }) : super(
          key: key,
          delegate: delegate,
        );

  @override
  _RenderSliverShrinkWrappedPersistentHeaderForWidgetsMixin createRenderObject(
      BuildContext context) {
    return _RenderSliverShrinkWrappedPinnedPersistentHeaderForWidgets(
        stretchConfiguration: delegate.stretchConfiguration);
  }
}

class _SliverShrinkWrappedFloatingPinnedPersistentHeader
    extends _SliverShrinkWrappedPersistentHeaderRenderObjectWidget {
  const _SliverShrinkWrappedFloatingPinnedPersistentHeader({
    Key key,
    @required SliverPersistentHeaderDelegate delegate,
  }) : super(
          key: key,
          delegate: delegate,
        );

  @override
  _RenderSliverShrinkWrappedPersistentHeaderForWidgetsMixin createRenderObject(
      BuildContext context) {
    return _RenderSliverShrinkWrappedFloatingPinnedPersistentHeaderForWidgets(
      snapConfiguration: delegate.snapConfiguration,
      stretchConfiguration: delegate.stretchConfiguration,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context,
      _RenderSliverShrinkWrappedFloatingPinnedPersistentHeaderForWidgets
          renderObject) {
    renderObject.snapConfiguration = delegate.snapConfiguration;
    renderObject.stretchConfiguration = delegate.stretchConfiguration;
  }
}

class _SliverShrinkWrappedFloatingPersistentHeader
    extends _SliverShrinkWrappedPersistentHeaderRenderObjectWidget {
  const _SliverShrinkWrappedFloatingPersistentHeader({
    Key key,
    @required SliverPersistentHeaderDelegate delegate,
  }) : super(
          key: key,
          delegate: delegate,
        );

  @override
  _RenderSliverShrinkWrappedPersistentHeaderForWidgetsMixin createRenderObject(
      BuildContext context) {
    return _RenderSliverShrinkWrappedFloatingPersistentHeaderForWidgets(
      snapConfiguration: delegate.snapConfiguration,
      stretchConfiguration: delegate.stretchConfiguration,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context,
      _RenderSliverShrinkWrappedFloatingPersistentHeaderForWidgets
          renderObject) {
    renderObject.snapConfiguration = delegate.snapConfiguration;
    renderObject.stretchConfiguration = delegate.stretchConfiguration;
  }
}

class _RenderSliverShrinkWrappedScrollingPersistentHeaderForWidgets
    extends RenderSliverScrollingPersistentHeader
    with _RenderSliverShrinkWrappedPersistentHeaderForWidgetsMixin {
  _RenderSliverShrinkWrappedScrollingPersistentHeaderForWidgets({
    RenderBox child,
    OverScrollHeaderStretchConfiguration stretchConfiguration,
  }) : super(
          child: child,
          stretchConfiguration: stretchConfiguration,
        );
}

class _RenderSliverShrinkWrappedPinnedPersistentHeaderForWidgets
    extends RenderSliverPinnedPersistentHeader
    with _RenderSliverShrinkWrappedPersistentHeaderForWidgetsMixin {
  _RenderSliverShrinkWrappedPinnedPersistentHeaderForWidgets({
    RenderBox child,
    OverScrollHeaderStretchConfiguration stretchConfiguration,
  }) : super(
          child: child,
          stretchConfiguration: stretchConfiguration,
        );
}

class _RenderSliverShrinkWrappedFloatingPinnedPersistentHeaderForWidgets
    extends RenderSliverFloatingPinnedPersistentHeader
    with _RenderSliverShrinkWrappedPersistentHeaderForWidgetsMixin {
  _RenderSliverShrinkWrappedFloatingPinnedPersistentHeaderForWidgets({
    RenderBox child,
    FloatingHeaderSnapConfiguration snapConfiguration,
    OverScrollHeaderStretchConfiguration stretchConfiguration,
  }) : super(
          child: child,
          snapConfiguration: snapConfiguration,
          stretchConfiguration: stretchConfiguration,
        );
}

class _RenderSliverShrinkWrappedFloatingPersistentHeaderForWidgets
    extends RenderSliverFloatingPersistentHeader
    with _RenderSliverShrinkWrappedPersistentHeaderForWidgetsMixin {
  _RenderSliverShrinkWrappedFloatingPersistentHeaderForWidgets({
    RenderBox child,
    FloatingHeaderSnapConfiguration snapConfiguration,
    OverScrollHeaderStretchConfiguration stretchConfiguration,
  }) : super(
          child: child,
          snapConfiguration: snapConfiguration,
          stretchConfiguration: stretchConfiguration,
        );
}
