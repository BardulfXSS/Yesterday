import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/slivers/shrink_wrapped_sliver_persistent_header.dart';

import '../test.dart';

void main() {
  <double>[100, 200, 500].forEach((extent) {
    testWidgets("sizes extent according to child's height", (t) async {
      await t.pumpWidget(shell<String>(
        child: CustomScrollView(
          slivers: [
            ShrinkWrappedSliverPersistentHeader(
                delegate: TestSliverPersistentHeaderDelegate(
              minExtent: 0,
              maxExtent: double.infinity,
              builder: (context, shrinkOffset, minExtent) => SizedBox(
                height: extent,
                child: Text('foo'),
              ),
            ))
          ],
        ),
      ));

      expect(
        t
            .renderObject<RenderSliver>(
                find.byType(ShrinkWrappedSliverPersistentHeader))
            .geometry
            .layoutExtent,
        extent,
      );
    });
    testWidgets("sizes extent according to child's width", (t) async {
      await t.pumpWidget(shell<String>(
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: [
            ShrinkWrappedSliverPersistentHeader(
                delegate: TestSliverPersistentHeaderDelegate(
              minExtent: 0,
              maxExtent: double.infinity,
              builder: (context, shrinkOffset, minExtent) => SizedBox(
                width: extent,
                child: Text('foo'),
              ),
            ))
          ],
        ),
      ));

      expect(
        t
            .renderObject<RenderSliver>(
                find.byType(ShrinkWrappedSliverPersistentHeader))
            .geometry
            .layoutExtent,
        extent,
      );
    });
  });
}
