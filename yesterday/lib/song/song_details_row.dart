import 'package:flutter/widgets.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/song/song.dart';
import 'package:yesterday/text/text.dart';

class SongDetailsRow extends StatelessWidget {
  final double height;
  const SongDetailsRow({
    Key key,
    this.height = 60,
    @required this.song,
  }) : super(key: key);

  final Song song;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: AlbumThumbnail(
              song: song,
              width: height,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleArtistRow(song: song),
                BodyText(song.album?.name ?? '', dark: true),
              ],
            ),
          ),
          DurationDisplay(duration: song.duration),
        ],
      ),
    );
  }
}
