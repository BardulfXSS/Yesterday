import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/playlist/playlist.dart';
import 'package:yesterday/slivers/slivers.dart';

class PlaylistGroupSliver extends StatefulWidget {
  final Map<String, List<Playlist>> playlistGroups;
  final ScrollController controller;

  PlaylistGroupSliver({
    Key key,
    @required this.playlistGroups,
    this.controller,
  }) : super(key: key);

  @override
  _PlaylistGroupSliverState createState() => _PlaylistGroupSliverState();
}

class _PlaylistGroupSliverState extends State<PlaylistGroupSliver>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ShrinkWrappedSliverPersistentHeader(
      floating: true,
      delegate: PlaylistGroupPersistentHeaderDelegate(
        controller: widget.controller,
        playlistGroups: widget.playlistGroups,
        snapConfiguration: widget.controller != null
            ? FloatingHeaderSnapConfiguration(
                vsync: this,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 200),
              )
            : null,
      ),
    );
  }
}

class PlaylistGroupPersistentHeaderDelegate
    implements SliverPersistentHeaderDelegate {
  final Map<String, List<Playlist>> playlistGroups;
  final ScrollController controller;
  @override
  final FloatingHeaderSnapConfiguration snapConfiguration;

  PlaylistGroupPersistentHeaderDelegate({
    @required this.playlistGroups,
    this.controller,
    this.snapConfiguration,
  })  : assert(playlistGroups.containsKey('artists')),
        assert(playlistGroups.containsKey('playlists')),
        assert(snapConfiguration == null || controller != null);

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
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: PlaylistGroup(
                  labelText: 'Artists',
                  playlists: playlistGroups['artists'],
                ),
              ),
              PlaylistGroup(
                labelText: 'Playlists',
                playlists: playlistGroups['playlists'],
              ),
            ],
          ),
        ),
      ),
    );
    return snapConfiguration == null
        ? result
        : SnapListener(
            controller: controller,
            child: result,
          );
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
