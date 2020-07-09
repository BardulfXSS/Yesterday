import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/slivers/slivers.dart';
import 'package:yesterday/song/song.dart';
import 'package:yesterday/text/text.dart';

final playlist = List.filled(4, Playlist((b) => b..name = 'fooooooooooo'),
    growable: true)
  ..add(Playlist((b) => b
    ..name = 'bar'
    ..songs.add(Song((b) => b
      ..title = 'foo'
      ..duration = Duration()
      ..album.update((b) => b
        ..name = 'Blackstar'
        ..coverArtUrl =
            'https://upload.wikimedia.org/wikipedia/en/9/97/Blackstar_%28Front_Cover%29.png')))))
  ..add(Playlist((b) => b
    ..name = 'bar'
    ..songs.addAll([
      Song((b) => b
        ..title = 'foo'
        ..duration = Duration()
        ..album.update((b) => b
          ..name = 'Blackstar'
          ..coverArtUrl =
              'https://upload.wikimedia.org/wikipedia/en/9/97/Blackstar_%28Front_Cover%29.png')),
      Song((b) => b
        ..title = 'foo'
        ..duration = Duration()
        ..album.update((b) => b
          ..name = 'foo'
          ..coverArtUrl =
              'https://media.architecturaldigest.com/photos/5890e88033bd1de9129eab0a/master/pass/Artist-Designed%20Album%20Covers%202.jpg')),
      Song((b) => b
        ..title = 'foo'
        ..duration = Duration()
        ..album.update((b) => b
          ..name = 'Smells Like Teen Spirit'
          ..coverArtUrl =
              'https://static.billboard.com/files/media/Nirvana-Nevermind-album-covers-billboard-1000x1000-compressed.jpg')),
      Song((b) => b
        ..title = 'foo'
        ..duration = Duration()
        ..album.update((b) => b
          ..name = 'Some Album'
          ..coverArtUrl =
              'https://i.pinimg.com/originals/da/18/3e/da183e46c3de1eaefa4f6705ca9a50dd.jpg')),
    ])));

// TODO: write test
// TODO: Add FAB to add song/playlist
// TODO: Make it possible to go back to top from middle of scroll
// TODO: Implement searching
class MainPage extends StatelessWidget {
  final ScrollController controller = ScrollController();
  MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            YesterdayTextField(
              suffixIcon: Icon(Icons.search),
              textAlignVertical: TextAlignVertical.center,
            ),
            Expanded(
              child: Neumorphic(
                style: NeumorphicStyle(
                  depth: 0,
                  boxShape: NeumorphicBoxShape.rect(),
                  color: NeumorphicTheme.variantColor(context),
                ),
                child: ScrollConfiguration(
                  behavior: YesterdayScrollBehavior(),
                  child: CustomScrollView(
                    controller: controller,
                    slivers: [
                      PlaylistGroupSliver(
                        controller: controller,
                        playlistGroups: {
                          'artists': playlist,
                          'playlists': playlist,
                        },
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          List.generate(
                            100,
                            (i) => SongTile(
                                song: Song((b) => b
                                  ..title = 'Song ${i + 1}'
                                  ..artist.name = 'Artist ${i + 1}'
                                  ..album.name = 'Album ${i + 1}'
                                  ..duration = Duration(milliseconds: 368000))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
