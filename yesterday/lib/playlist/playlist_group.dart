import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/playlist/playlist.dart';
import 'package:yesterday/slivers/slivers.dart';
import 'package:yesterday/text/text.dart';

class PlaylistGroup extends StatelessWidget {
  final String labelText;
  final List<Playlist> playlists;
  const PlaylistGroup({
    Key key,
    this.labelText,
    @required this.playlists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LabelText(labelText),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Neumorphic(
            padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.rect(),
              depth: -NeumorphicTheme.depth(context),
            ),
            child: ScrollConfiguration(
              behavior: YesterdayScrollBehavior(),
              child: UnboundedListView.builder(
                itemBuilder: (_, i) => Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: PlaylistTile(playlist: playlists[i]),
                ),
                itemCount: playlists.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
