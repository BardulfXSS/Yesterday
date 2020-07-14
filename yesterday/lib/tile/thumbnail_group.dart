import 'package:built_collection/built_collection.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/slivers/slivers.dart';
import 'package:yesterday/text/text.dart';
import 'package:yesterday/tile/tile.dart';

class ThumbnailGroup extends StatelessWidget {
  final String labelText;
  final BuiltList<TileContent> tileContents;
  const ThumbnailGroup({Key key, this.labelText, @required this.tileContents})
      : super(key: key);

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
                  child: ThumbnailTile(content: tileContents[i]),
                ),
                itemCount: tileContents.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
