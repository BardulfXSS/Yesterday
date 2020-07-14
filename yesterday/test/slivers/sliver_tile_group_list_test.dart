import 'dart:math' as math;

import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/slivers/slivers.dart';
import 'package:yesterday/tile/tile.dart';

import '../test.dart';

void main() => group('SliverTileGroupList', () {
      testWidgets('displays inside a SliverPersistentHeader', (t) async {
        mockNetworkImagesFor(() async {
          await t.pumpWidget(shell<String>(
            child: CustomScrollView(
              slivers: [
                SliverTileGroupList(
                  tileGroupContents: [
                    TileGroupContent((b) => b
                      ..labelText = 'Artists'
                      ..tileContents.add(Artist((b) => b.name = 'foo'))),
                  ].toBuiltList(),
                ),
              ],
            ),
          ));

          expect(
              find.byType(SliverShrinkWrappedPersistentHeader), findsOneWidget);
        });
      });
      testWidgets('snaps shut when user scrolls up from top', (t) async {
        mockNetworkImagesFor(() async {
          await t.pumpWidget(shell<String>(
            child: CustomScrollView(
              slivers: [
                SliverTileGroupList(
                  tileGroupContents: [
                    TileGroupContent((b) => b
                      ..labelText = 'Artists'
                      ..tileContents.add(Artist((b) => b.name = 'foo'))),
                  ].toBuiltList(),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((_, i) => Text('$i')),
                ),
              ],
            ),
          ));

          expect(find.byType(SliverTileGroupList), findsOneWidget);

          await t.dragFrom(
              Offset(400, 300), Offset.fromDirection(-math.pi / 2));
          await t.pumpAndSettle();

          expect(find.byType(SliverTileGroupList), findsNothing);
        });
      });
      testWidgets('snaps open when user scrolls down from top', (t) async {
        mockNetworkImagesFor(() async {
          await t.pumpWidget(shell<String>(
            child: CustomScrollView(
              slivers: [
                SliverTileGroupList(
                  tileGroupContents: [
                    TileGroupContent((b) => b
                      ..labelText = 'Artists'
                      ..tileContents.add(Artist((b) => b.name = 'foo'))),
                  ].toBuiltList(),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((_, i) => Text('$i')),
                ),
              ],
            ),
          ));

          await t.dragFrom(
              Offset(400, 300), Offset.fromDirection(-math.pi / 2));
          await t.pumpAndSettle();

          expect(find.text('1'), findsOneWidget);
          expect(find.byType(SliverTileGroupList), findsNothing);

          await t.dragFrom(Offset(400, 300), Offset.fromDirection(math.pi / 2));
          await t.pumpAndSettle();

          expect(find.text('1'), findsOneWidget);
          expect(find.byType(SliverTileGroupList), findsOneWidget);
        });
      });
      testWidgets('snaps open when user scrolls down from middle', (t) async {
        mockNetworkImagesFor(() async {
          await t.pumpWidget(shell<String>(
            child: CustomScrollView(
              slivers: [
                SliverTileGroupList(
                  tileGroupContents: [
                    TileGroupContent((b) => b
                      ..labelText = 'Artists'
                      ..tileContents.add(Artist((b) => b.name = 'foo'))),
                  ].toBuiltList(),
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
          expect(find.byType(SliverTileGroupList), findsOneWidget);
        });
      });
      testWidgets('snaps shut when user scrolls up from middle', (t) async {
        mockNetworkImagesFor(() async {
          await t.pumpWidget(shell<String>(
            child: CustomScrollView(
              slivers: [
                SliverTileGroupList(
                  tileGroupContents: [
                    TileGroupContent((b) => b
                      ..labelText = 'Artists'
                      ..tileContents.add(Artist((b) => b.name = 'foo'))),
                  ].toBuiltList(),
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

          await t.dragFrom(
              Offset(400, 300), Offset.fromDirection(-math.pi / 2));
          await t.pumpAndSettle();

          expect(find.byType(SliverTileGroupList), findsNothing);
        });
      });
      testWidgets('displays artists playlist group', (t) async {
        mockNetworkImagesFor(() async {
          await t.pumpWidget(shell<String>(
            child: CustomScrollView(
              slivers: [
                SliverTileGroupList(
                  tileGroupContents: [
                    TileGroupContent((b) => b
                      ..labelText = 'Artists'
                      ..tileContents.add(Artist((b) => b.name = 'foo'))),
                  ].toBuiltList(),
                ),
              ],
            ),
          ));

          expect(find.text('Artists'), findsOneWidget);
          expect(
            find.descendant(
              of: find.byType(ThumbnailGroup),
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
                SliverTileGroupList(
                  tileGroupContents: [
                    TileGroupContent((b) => b
                      ..labelText = 'Playlists'
                      ..tileContents.add(Playlist((b) => b.name = 'foo'))),
                  ].toBuiltList(),
                ),
              ],
            ),
          ));

          expect(find.text('Playlists'), findsOneWidget);
          expect(
            find.descendant(
              of: find.byType(ThumbnailGroup),
              matching: find.text('foo'),
            ),
            findsOneWidget,
          );
        });
      });
    });
