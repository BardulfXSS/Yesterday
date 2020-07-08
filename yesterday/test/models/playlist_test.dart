import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:yesterday/models/models.dart';

import '../test.dart';

void main() {
  group('thumbnail', () {
    testWidgets('shows default image while loading', (t) async {
      mockNetworkImagesFor(() async {
        final url = 'https://i.pinimg.com/originals/da/18/3e/'
            'da183e46c3de1eaefa4f6705ca9a50dd.jpg';
        await t.pumpWidget(shell<String>(
          child: Playlist((b) => b
            ..name = 'foo'
            ..songs.add(Song((b) => b
              ..title = 'foo'
              ..album.update((b) => b
                ..name = 'bar'
                ..coverArtUrl = url)
              ..duration = Duration()))).thumbnail,
        ));
        final NetworkImage img = t.widget<Image>(find.byType(Image)).image;
        final NetworkImage defaultImg = Playlist.defaultThumbnail.image;

        expect(img.url, defaultImg.url);
      });
    });
    group('after loading', () {
      group('given 0 songs with albumArtUrls', () {
        testWidgets('shows default image', (t) async {
          mockNetworkImagesFor(() async {
            await t.pumpWidget(shell<String>(
              child: Playlist((b) => b.name = 'foo').thumbnail,
            ));
            await t.pumpAndSettle();

            final NetworkImage img = t.widget<Image>(find.byType(Image)).image;
            final NetworkImage defaultImg = Playlist.defaultThumbnail.image;

            expect(img.url, defaultImg.url);
          });
        });
      });
      group('given < 4 songs with albumArtUrls', () {
        testWidgets('shows album art given albumArtUrl', (t) async {
          mockNetworkImagesFor(() async {
            final url = 'https://i.pinimg.com/originals/da/18/3e/'
                'da183e46c3de1eaefa4f6705ca9a50dd.jpg';
            await t.pumpWidget(shell<String>(
              child: Playlist((b) => b
                ..name = 'foo'
                ..songs.add(Song((b) => b
                  ..title = 'foo'
                  ..album.update((b) => b
                    ..name = 'bar'
                    ..coverArtUrl = url)
                  ..duration = Duration()))).thumbnail,
            ));
            await t.pumpAndSettle();

            final NetworkImage img = t.widget<Image>(find.byType(Image)).image;

            expect(img.url, url);
          });
        });
      });
      group('given >= 4 songs with albumArtUrls', () {
        testWidgets('shows 4x4 grid of album art covers', (t) async {
          mockNetworkImagesFor(() async {
            final urls = [
              'https://upload.wikimedia.org/wikipedia/en/9/97/Blackstar_%28Front_Cover%29.png',
              'https://media.architecturaldigest.com/photos/5890e88033bd1de9129eab0a/master/pass/Artist-Designed%20Album%20Covers%202.jpg',
              'https://static.billboard.com/files/media/Nirvana-Nevermind-album-covers-billboard-1000x1000-compressed.jpg',
              'https://i.pinimg.com/originals/da/18/3e/da183e46c3de1eaefa4f6705ca9a50dd.jpg',
            ];
            await t.pumpWidget(shell<String>(
              child: Playlist((b) => b
                ..name = 'foo'
                ..songs.addAll(
                  urls.map((u) => Song((b) => b
                    ..title = 'foo'
                    ..album.update((b) => b
                      ..name = 'bar'
                      ..coverArtUrl = u)
                    ..duration = Duration())),
                )).thumbnail,
            ));
            await t.pumpAndSettle();

            expect(find.byType(GridView), findsOneWidget);
            final gridView = t.widget<GridView>(find.byType(GridView));

            final SliverGridDelegateWithFixedCrossAxisCount gridDelegate =
                gridView.gridDelegate;
            expect(gridDelegate.crossAxisCount, 2);

            final SliverChildListDelegate childDelegate =
                gridView.childrenDelegate;
            expect(childDelegate.children, hasLength(4));

            expect(
              t
                  .widgetList<Image>(find.byType(Image))
                  .map((i) => i.image as NetworkImage)
                  .map((ni) => ni.url)
                  .toList(),
              urls,
            );
          });
        });
      });
    });
  });
}
