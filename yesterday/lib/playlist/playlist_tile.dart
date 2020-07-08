import 'package:flutter/widgets.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/text/text.dart';

class PlaylistTile extends StatelessWidget {
  final Playlist playlist;
  final double width;
  const PlaylistTile({Key key, this.playlist, this.width = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          playlist.thumbnail,
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: YesterdayText(playlist.name),
          ),
        ],
      ),
    );
  }
}
