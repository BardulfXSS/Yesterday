import 'package:flutter/widgets.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/text/text.dart';

class ThumbnailTile extends StatelessWidget {
  final TileContent content;
  final double width;
  const ThumbnailTile({Key key, @required this.content, this.width = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          SizedBox(height: width, child: content.thumbnail),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: YesterdayText(content.name),
          ),
        ],
      ),
    );
  }
}
