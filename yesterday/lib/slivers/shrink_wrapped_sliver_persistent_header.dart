import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// The only custom code is in here
mixin _ShrinkWrappedRenderSliverPersistentHeaderForWidgetsMixin
    on RenderSliverPersistentHeader {
  _ShrinkWrappedSliverPersistentHeaderElement _element;
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
class ShrinkWrappedSliverPersistentHeader extends SliverPersistentHeader {
  const ShrinkWrappedSliverPersistentHeader({
    Key key,
    @required delegate,
    pinned = false,
    floating = false,
  }) : super(key: key, delegate: delegate, pinned: pinned, floating: floating);

  @override
  Widget build(BuildContext context) {
    if (floating && pinned)
      return _ShrinkWrappedSliverFloatingPinnedPersistentHeader(
          delegate: delegate);
    if (pinned)
      return _ShrinkWrappedSliverPinnedPersistentHeader(delegate: delegate);
    if (floating)
      return _ShrinkWrappedSliverFloatingPersistentHeader(delegate: delegate);
    return _ShrinkWrappedSliverScrollingPersistentHeader(delegate: delegate);
  }
}

class _ShrinkWrappedSliverPersistentHeaderElement extends RenderObjectElement {
  _ShrinkWrappedSliverPersistentHeaderElement(
      _ShrinkWrappedSliverPersistentHeaderRenderObjectWidget widget)
      : super(widget);

  @override
  _ShrinkWrappedSliverPersistentHeaderRenderObjectWidget get widget =>
      super.widget as _ShrinkWrappedSliverPersistentHeaderRenderObjectWidget;

  @override
  _ShrinkWrappedRenderSliverPersistentHeaderForWidgetsMixin get renderObject =>
      super.renderObject
          as _ShrinkWrappedRenderSliverPersistentHeaderForWidgetsMixin;

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
      _ShrinkWrappedSliverPersistentHeaderRenderObjectWidget newWidget) {
    final _ShrinkWrappedSliverPersistentHeaderRenderObjectWidget oldWidget =
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

abstract class _ShrinkWrappedSliverPersistentHeaderRenderObjectWidget
    extends RenderObjectWidget {
  const _ShrinkWrappedSliverPersistentHeaderRenderObjectWidget({
    Key key,
    @required this.delegate,
  })  : assert(delegate != null),
        super(key: key);

  final SliverPersistentHeaderDelegate delegate;

  @override
  _ShrinkWrappedSliverPersistentHeaderElement createElement() =>
      _ShrinkWrappedSliverPersistentHeaderElement(this);

  @override
  _ShrinkWrappedRenderSliverPersistentHeaderForWidgetsMixin createRenderObject(
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

class _ShrinkWrappedSliverScrollingPersistentHeader
    extends _ShrinkWrappedSliverPersistentHeaderRenderObjectWidget {
  const _ShrinkWrappedSliverScrollingPersistentHeader({
    Key key,
    @required SliverPersistentHeaderDelegate delegate,
  }) : super(
          key: key,
          delegate: delegate,
        );

  @override
  _ShrinkWrappedRenderSliverPersistentHeaderForWidgetsMixin createRenderObject(
      BuildContext context) {
    return _ShrinkWrappedRenderSliverScrollingPersistentHeaderForWidgets(
        stretchConfiguration: delegate.stretchConfiguration);
  }
}

class _ShrinkWrappedSliverPinnedPersistentHeader
    extends _ShrinkWrappedSliverPersistentHeaderRenderObjectWidget {
  const _ShrinkWrappedSliverPinnedPersistentHeader({
    Key key,
    @required SliverPersistentHeaderDelegate delegate,
  }) : super(
          key: key,
          delegate: delegate,
        );

  @override
  _ShrinkWrappedRenderSliverPersistentHeaderForWidgetsMixin createRenderObject(
      BuildContext context) {
    return _ShrinkWrappedRenderSliverPinnedPersistentHeaderForWidgets(
        stretchConfiguration: delegate.stretchConfiguration);
  }
}

class _ShrinkWrappedSliverFloatingPinnedPersistentHeader
    extends _ShrinkWrappedSliverPersistentHeaderRenderObjectWidget {
  const _ShrinkWrappedSliverFloatingPinnedPersistentHeader({
    Key key,
    @required SliverPersistentHeaderDelegate delegate,
  }) : super(
          key: key,
          delegate: delegate,
        );

  @override
  _ShrinkWrappedRenderSliverPersistentHeaderForWidgetsMixin createRenderObject(
      BuildContext context) {
    return _ShrinkWrappedRenderSliverFloatingPinnedPersistentHeaderForWidgets(
      snapConfiguration: delegate.snapConfiguration,
      stretchConfiguration: delegate.stretchConfiguration,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context,
      _ShrinkWrappedRenderSliverFloatingPinnedPersistentHeaderForWidgets
          renderObject) {
    renderObject.snapConfiguration = delegate.snapConfiguration;
    renderObject.stretchConfiguration = delegate.stretchConfiguration;
  }
}

class _ShrinkWrappedSliverFloatingPersistentHeader
    extends _ShrinkWrappedSliverPersistentHeaderRenderObjectWidget {
  const _ShrinkWrappedSliverFloatingPersistentHeader({
    Key key,
    @required SliverPersistentHeaderDelegate delegate,
  }) : super(
          key: key,
          delegate: delegate,
        );

  @override
  _ShrinkWrappedRenderSliverPersistentHeaderForWidgetsMixin createRenderObject(
      BuildContext context) {
    return _ShrinkWrappedRenderSliverFloatingPersistentHeaderForWidgets(
      snapConfiguration: delegate.snapConfiguration,
      stretchConfiguration: delegate.stretchConfiguration,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context,
      _ShrinkWrappedRenderSliverFloatingPersistentHeaderForWidgets
          renderObject) {
    renderObject.snapConfiguration = delegate.snapConfiguration;
    renderObject.stretchConfiguration = delegate.stretchConfiguration;
  }
}

class _ShrinkWrappedRenderSliverScrollingPersistentHeaderForWidgets
    extends RenderSliverScrollingPersistentHeader
    with _ShrinkWrappedRenderSliverPersistentHeaderForWidgetsMixin {
  _ShrinkWrappedRenderSliverScrollingPersistentHeaderForWidgets({
    RenderBox child,
    OverScrollHeaderStretchConfiguration stretchConfiguration,
  }) : super(
          child: child,
          stretchConfiguration: stretchConfiguration,
        );
}

class _ShrinkWrappedRenderSliverPinnedPersistentHeaderForWidgets
    extends RenderSliverPinnedPersistentHeader
    with _ShrinkWrappedRenderSliverPersistentHeaderForWidgetsMixin {
  _ShrinkWrappedRenderSliverPinnedPersistentHeaderForWidgets({
    RenderBox child,
    OverScrollHeaderStretchConfiguration stretchConfiguration,
  }) : super(
          child: child,
          stretchConfiguration: stretchConfiguration,
        );
}

class _ShrinkWrappedRenderSliverFloatingPinnedPersistentHeaderForWidgets
    extends RenderSliverFloatingPinnedPersistentHeader
    with _ShrinkWrappedRenderSliverPersistentHeaderForWidgetsMixin {
  _ShrinkWrappedRenderSliverFloatingPinnedPersistentHeaderForWidgets({
    RenderBox child,
    FloatingHeaderSnapConfiguration snapConfiguration,
    OverScrollHeaderStretchConfiguration stretchConfiguration,
  }) : super(
          child: child,
          snapConfiguration: snapConfiguration,
          stretchConfiguration: stretchConfiguration,
        );
}

class _ShrinkWrappedRenderSliverFloatingPersistentHeaderForWidgets
    extends RenderSliverFloatingPersistentHeader
    with _ShrinkWrappedRenderSliverPersistentHeaderForWidgetsMixin {
  _ShrinkWrappedRenderSliverFloatingPersistentHeaderForWidgets({
    RenderBox child,
    FloatingHeaderSnapConfiguration snapConfiguration,
    OverScrollHeaderStretchConfiguration stretchConfiguration,
  }) : super(
          child: child,
          snapConfiguration: snapConfiguration,
          stretchConfiguration: stretchConfiguration,
        );
}
