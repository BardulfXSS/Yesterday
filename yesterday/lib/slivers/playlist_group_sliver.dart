import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/playlist/playlist.dart';
import 'package:yesterday/slivers/slivers.dart';

class PlaylistGroupSliver extends StatefulWidget {
  final Map<String, List<Playlist>> playlistGroups;

  PlaylistGroupSliver({Key key, this.playlistGroups}) : super(key: key);

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
        playlistGroups: widget.playlistGroups,
        snapConfiguration: FloatingHeaderSnapConfiguration(
          vsync: this,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 200),
        ),
      ),
    );
  }
}

class PlaylistGroupPersistentHeaderDelegate
    implements SliverPersistentHeaderDelegate {
  final Map<String, List<Playlist>> playlistGroups;
  @override
  final FloatingHeaderSnapConfiguration snapConfiguration;

  PlaylistGroupPersistentHeaderDelegate({
    this.playlistGroups,
    this.snapConfiguration,
  })  : assert(playlistGroups.containsKey('artists')),
        assert(playlistGroups.containsKey('playlists'));

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SnapListener(
      child: Neumorphic(
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
      ),
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

class SnapListener extends StatefulWidget {
  final Widget child;

  SnapListener({Key key, this.child}) : super(key: key);

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
    else
      header?.maybeStartSnapAnimation(_position.userScrollDirection);
  }
}
