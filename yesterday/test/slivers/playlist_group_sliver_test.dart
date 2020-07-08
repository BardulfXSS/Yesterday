import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/playlist/playlist.dart';
import 'package:yesterday/slivers/slivers.dart';

import '../test.dart';

void main() {
  testWidgets('displays inside a SliverPersistentHeader', (t) async {
    mockNetworkImagesFor(() async {
      await t.pumpWidget(shell<String>(
        child: CustomScrollView(
          slivers: [
            PlaylistGroupSliver(
              playlistGroups: {
                'artists': [Playlist((b) => b.name = 'foo')],
                'playlists': [],
              },
            ),
          ],
        ),
      ));

      expect(find.byType(ShrinkWrappedSliverPersistentHeader), findsOneWidget);
    });
  });
  testWidgets('displays artists playlist group', (t) async {
    mockNetworkImagesFor(() async {
      await t.pumpWidget(shell<String>(
        child: CustomScrollView(
          slivers: [
            PlaylistGroupSliver(
              playlistGroups: {
                'artists': [Playlist((b) => b.name = 'foo')],
                'playlists': [],
              },
            ),
          ],
        ),
      ));

      expect(find.text('Artists'), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(PlaylistGroup),
          matching: find.text('foo'),
        ),
        findsOneWidget,
      );
    });
  });
  testWidgets('displays playlists playlist group', (t) async {
    mockNetworkImagesFor(() async {
      await t.pumpWidget(shell<String>(
        child: CustomScrollView(
          slivers: [
            PlaylistGroupSliver(
              playlistGroups: {
                'playlists': [Playlist((b) => b.name = 'foo')],
                'artists': [],
              },
            ),
          ],
        ),
      ));

      expect(find.text('Playlists'), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(PlaylistGroup),
          matching: find.text('foo'),
        ),
        findsOneWidget,
      );
    });
  });
}
