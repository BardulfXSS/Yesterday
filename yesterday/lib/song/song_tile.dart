import 'package:flutter/widgets.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/song/song.dart';

class SongTile extends StatelessWidget {
  final Song song;

  const SongTile({
    Key key,
    @required this.song,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YesterdayCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SongDetailsRow(
          song: song,
          height: 60,
        ),
      ),
    );
  }
}
