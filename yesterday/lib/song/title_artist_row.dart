import 'package:flutter/widgets.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/text/text.dart';

class TitleArtistRow extends StatelessWidget {
  const TitleArtistRow({
    Key key,
    @required this.song,
  }) : super(key: key);

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LabelText(song.title, dark: true),
        if (song.artist != null)
          BodyText(
            ' • ' + song.artist.name,
            dark: true,
          ),
      ],
    );
  }
}
