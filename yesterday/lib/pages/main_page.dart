import 'package:built_collection/built_collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:yesterday/blocs/blocs.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/services/music_service.dart';
import 'package:yesterday/slivers/slivers.dart';
import 'package:yesterday/text/text.dart';
import 'package:yesterday/tile/tile.dart';

// TODO: write test
// TODO: Add FAB to add song/playlist
// TODO: Make it possible to go back to top from middle of scroll
// TODO: Implement searching
// TODO: Wire up clicking on artist or playlist
// TODO: Play song when clicked
class MainPage<T> extends StatelessWidget {
  MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => MusicBloc(
        user: c.read<T>(),
        musicService: PlaceholderMusicService<T>(),
      )..add(GetMusic()),
      child: SafeArea(
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
                    child: BlocBuilder<MusicBloc<T>, MusicState>(
                      builder: (_, s) {
                        if (s is MusicHasData) {
                          final data = s.data;
                          return MusicDisplay(music: data);
                        } else if (s is MusicFailure) {
                          return Center(
                            child: LabelText(
                              s.message,
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        } else {
                          return Center(child: LabelText('Waiting for data'));
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TODO: Test
class MusicDisplay extends StatelessWidget {
  final MusicData music;

  MusicDisplay({Key key, @required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverTileGroupList(
          tileGroupContents: [
            TileGroupContent((b) => b
              ..labelText = 'Artists'
              ..tileContents.addAll(music.artists)),
            TileGroupContent((b) => b
              ..labelText = 'Playlists'
              ..tileContents.addAll(music.playlists)),
          ].toBuiltList(),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            music.songs.map((s) => SongTile(song: s)).toList(),
          ),
        )
      ],
    );
  }
}
