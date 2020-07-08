import 'dart:math' as math;

import 'package:flutter/widgets.dart';
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
  testWidgets('snaps shut when user scrolls up from top', (t) async {
    mockNetworkImagesFor(() async {
      final controller = ScrollController();
      await t.pumpWidget(shell<String>(
        child: CustomScrollView(
          controller: controller,
          slivers: [
            PlaylistGroupSliver(
              controller: controller,
              playlistGroups: {'artists': [], 'playlists': []},
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((_, i) => Text('$i')),
            ),
          ],
        ),
      ));

      expect(find.byType(PlaylistGroupSliver), findsOneWidget);

      await t.dragFrom(Offset(400, 300), Offset.fromDirection(-math.pi / 2));
      await t.pumpAndSettle();

      expect(find.byType(PlaylistGroupSliver), findsNothing);
    });
  });
  testWidgets('snaps open when user scrolls down from top', (t) async {
    mockNetworkImagesFor(() async {
      final controller = ScrollController();
      await t.pumpWidget(shell<String>(
        child: CustomScrollView(
          controller: controller,
          slivers: [
            PlaylistGroupSliver(
              controller: controller,
              playlistGroups: {'artists': [], 'playlists': []},
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((_, i) => Text('$i')),
            ),
          ],
        ),
      ));

      await t.dragFrom(Offset(400, 300), Offset.fromDirection(-math.pi / 2));
      await t.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
      expect(find.byType(PlaylistGroupSliver), findsNothing);

      await t.dragFrom(Offset(400, 300), Offset.fromDirection(math.pi / 2));
      await t.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
      expect(find.byType(PlaylistGroupSliver), findsOneWidget);
    });
  });
  testWidgets('snaps open when user scrolls down from middle', (t) async {
    mockNetworkImagesFor(() async {
      final controller = ScrollController();
      await t.pumpWidget(shell<String>(
        child: CustomScrollView(
          controller: controller,
          slivers: [
            PlaylistGroupSliver(
              controller: controller,
              playlistGroups: {'artists': [], 'playlists': []},
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((_, i) => Text('$i')),
            ),
          ],
        ),
      ));

      await t.dragFrom(
          Offset(400, 300), Offset.fromDirection(-math.pi / 2, 1000));
      await t.pumpAndSettle();

      expect(find.text('1'), findsNothing);

      await t.dragFrom(Offset(400, 300), Offset.fromDirection(math.pi / 2));
      await t.pumpAndSettle();

      expect(find.text('1'), findsNothing);
      expect(find.byType(PlaylistGroupSliver), findsOneWidget);
    });
  });
  testWidgets('snaps shut when user scrolls up from middle', (t) async {
    mockNetworkImagesFor(() async {
      final controller = ScrollController();
      await t.pumpWidget(shell<String>(
        child: CustomScrollView(
          controller: controller,
          slivers: [
            PlaylistGroupSliver(
              controller: controller,
              playlistGroups: {'artists': [], 'playlists': []},
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((_, i) => Text('$i')),
            ),
          ],
        ),
      ));

      await t.dragFrom(
          Offset(400, 300), Offset.fromDirection(-math.pi / 2, 1000));
      await t.pumpAndSettle();

      expect(find.text('1'), findsNothing);

      await t.dragFrom(Offset(400, 300), Offset.fromDirection(math.pi / 2));
      await t.pumpAndSettle();

      await t.dragFrom(Offset(400, 300), Offset.fromDirection(-math.pi / 2));
      await t.pumpAndSettle();

      expect(find.byType(PlaylistGroupSliver), findsNothing);
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
