import 'package:built_collection/built_collection.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart' hide Builder;
import 'package:yesterday/models/models.dart';
import 'package:yesterday/slivers/slivers.dart';
import 'package:yesterday/tile/tile.dart';

class SliverTileGroupList extends StatefulWidget {
  final BuiltList<TileGroupContent> tileGroupContents;

  SliverTileGroupList({
    Key key,
    @required this.tileGroupContents,
  }) : super(key: key);

  @override
  _SliverTileGroupListState createState() => _SliverTileGroupListState();
}

class _SliverTileGroupListState extends State<SliverTileGroupList>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SliverShrinkWrappedPersistentHeader(
      floating: true,
      delegate: TileGroupPersistentHeaderDelegate(
        tileGroupContents: widget.tileGroupContents,
        snapConfiguration: FloatingHeaderSnapConfiguration(
          vsync: this,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 200),
        ),
      ),
    );
  }
}

class TileGroupPersistentHeaderDelegate
    implements SliverPersistentHeaderDelegate {
  final BuiltList<TileGroupContent> tileGroupContents;
  @override
  final FloatingHeaderSnapConfiguration snapConfiguration;

  TileGroupPersistentHeaderDelegate({
    @required this.tileGroupContents,
    this.snapConfiguration,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final result = Neumorphic(
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        )),
        depth: NeumorphicTheme.depth(context),
      ),
      child: SingleChildScrollView(
        child: Container(
          color: NeumorphicTheme.baseColor(context),
          child: Column(
            children: tileGroupContents
                .map((c) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ThumbnailGroup(
                        labelText: c.labelText,
                        tileContents: c.tileContents,
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
    return snapConfiguration == null ? result : SnapListener(child: result);
  }

  @override
  double get maxExtent => double.infinity;
  @override
  double get minExtent => 0;
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}
