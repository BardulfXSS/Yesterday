import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/playlist/playlist.dart';

import '../test.dart';

void main() {
  testWidgets('displays playlist name', (t) async {
    mockNetworkImagesFor(() async {
      await t.pumpWidget(shell<String>(
        child: PlaylistTile(
          playlist: Playlist((b) => b.name = 'foo'),
        ),
      ));

      expect(find.text('foo'), findsOneWidget);
    });
  });
  testWidgets('displays playlist thumbnail', (t) async {
    mockNetworkImagesFor(() async {
      final url = 'foo.com';
      await t.pumpWidget(shell<String>(
        child: PlaylistTile(
          playlist: Playlist((b) => b
            ..name = 'foo'
            ..songs.add(Song((b) => b
              ..title = 'foo'
              ..album.update((b) => b
                ..name = 'bar'
                ..coverArtUrl = url)
              ..duration = Duration()))),
        ),
      ));

      await t.pumpAndSettle();

      final NetworkImage img = t.widget<Image>(find.byType(Image)).image;

      expect(img.url, url);
    });
  });
  <double>[50, 100, 200].forEach((width) {
    testWidgets('fits to given width', (t) async {
      mockNetworkImagesFor(() async {
        await t.pumpWidget(shell<String>(
          child: PlaylistTile(
            playlist: Playlist((b) => b.name = 'foo'),
            width: width,
          ),
        ));

        expect(t.getSize(find.byType(PlaylistTile)).width, width);
      });
    });
  });
}
