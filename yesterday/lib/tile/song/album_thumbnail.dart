import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:yesterday/models/models.dart';

class AlbumThumbnail extends StatelessWidget {
  final Song song;
  final double width;
  const AlbumThumbnail({Key key, this.song, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 10),
      child: SizedBox(
        width: width,
        child: Neumorphic(
          style: NeumorphicStyle(
            depth: NeumorphicTheme.depth(context) / 2,
            boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.all(Radius.circular(10))),
          ),
          child: song.thumbnail,
        ),
      ),
    );
  }
}
