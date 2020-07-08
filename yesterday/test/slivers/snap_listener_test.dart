import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/slivers/slivers.dart';

import '../test.dart';

Widget _snapListenerBoilerplate({ScrollController controller, Widget child}) =>
    CustomScrollView(
      controller: controller,
      slivers: [
        SnapConfigurationBuilder(
          curve: Curves.easeOut,
          duration: Duration(milliseconds: 200),
          builder: (_, sc) => ShrinkWrappedSliverPersistentHeader(
            delegate: TestSliverPersistentHeaderDelegate(
              maxExtent: double.infinity,
              minExtent: 0,
              snapConfiguration: sc,
              builder: (c, s, m) => SnapListener(
                controller: controller,
                child: child,
              ),
            ),
            floating: true,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((c, i) => Text('$i')),
        ),
      ],
    );

void main() {
  testWidgets('snaps shut when user scrolls up from top', (t) async {
    final controller = ScrollController();
    await t.pumpWidget(shell<String>(
      child: _snapListenerBoilerplate(
        controller: controller,
        child: SizedBox(
          height: 500,
          child: Text('foo'),
        ),
      ),
    ));

    expect(find.text('foo'), findsOneWidget);

    await t.drag(find.text('3'), Offset.fromDirection(-math.pi / 2));
    await t.pumpAndSettle();

    expect(find.text('foo'), findsNothing);
  });
  testWidgets('snaps open when user scrolls down from top', (t) async {
    final controller = ScrollController();
    await t.pumpWidget(shell<String>(
      child: _snapListenerBoilerplate(
        controller: controller,
        child: SizedBox(
          height: 500,
          child: Text('foo'),
        ),
      ),
    ));

    await t.drag(find.text('3'), Offset.fromDirection(-math.pi / 2));
    await t.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('foo'), findsNothing);

    await t.drag(find.text('3'), Offset.fromDirection(math.pi / 2));
    await t.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('foo'), findsOneWidget);
  });
  testWidgets('snaps open when user scrolls down from middle', (t) async {
    final controller = ScrollController();
    await t.pumpWidget(shell<String>(
      child: _snapListenerBoilerplate(
        controller: controller,
        child: SizedBox(
          height: 500,
          child: Text('foo'),
        ),
      ),
    ));

    await t.drag(find.text('3'), Offset.fromDirection(-math.pi / 2, 1000));
    await t.pumpAndSettle();

    expect(find.text('1'), findsNothing);

    await t.dragFrom(Offset(400, 300), Offset.fromDirection(math.pi / 2));
    await t.pumpAndSettle();

    expect(find.text('1'), findsNothing);
    expect(find.text('foo'), findsOneWidget);
  });
  testWidgets('snaps shut when user scrolls up from middle', (t) async {
    final controller = ScrollController();
    await t.pumpWidget(shell<String>(
      child: _snapListenerBoilerplate(
        controller: controller,
        child: SizedBox(
          height: 500,
          child: Text('foo'),
        ),
      ),
    ));

    await t.drag(find.text('3'), Offset.fromDirection(-math.pi / 2, 1000));
    await t.pumpAndSettle();

    expect(find.text('1'), findsNothing);

    await t.dragFrom(Offset(400, 300), Offset.fromDirection(math.pi / 2));
    await t.pumpAndSettle();

    await t.dragFrom(Offset(400, 300), Offset.fromDirection(-math.pi / 2));
    await t.pumpAndSettle();

    expect(find.text('foo'), findsNothing);
  });
}
