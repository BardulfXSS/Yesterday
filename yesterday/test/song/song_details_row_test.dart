import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/song/song.dart';

import '../test.dart';

void main() {
  testWidgets('displays album thumbnail', (t) async {
    mockNetworkImagesFor(() async {
      final url = 'foo.com/bar';
      await t.pumpWidget(shell<String>(
        child: SongDetailsRow(
          song: Song((b) => b
            ..title = 'foo'
            ..album.update((b) => b
              ..name = 'bar'
              ..coverArtUrl = url)
            ..duration = Duration()),
        ),
      ));

      final NetworkImage img = t.widget<Image>(find.byType(Image)).image;
      expect(img.url, url);
    });
  });
  testWidgets('displays title', (t) async {
    mockNetworkImagesFor(() async {
      await t.pumpWidget(shell<String>(
        child: SongDetailsRow(
          song: Song((b) => b
            ..title = 'foo'
            ..duration = Duration()),
        ),
      ));

      expect(find.text('foo'), findsOneWidget);
    });
  });
  testWidgets('displays artist if provided', (t) async {
    mockNetworkImagesFor(() async {
      await t.pumpWidget(shell<String>(
        child: SongDetailsRow(
          song: Song((b) => b
            ..title = 'foo'
            ..artist.name = 'bar'
            ..duration = Duration()),
        ),
      ));

      expect(find.text(' • bar'), findsOneWidget);
    });
  });
  testWidgets('displays album if provided', (t) async {
    mockNetworkImagesFor(() async {
      await t.pumpWidget(shell<String>(
        child: SongDetailsRow(
          song: Song((b) => b
            ..title = 'foo'
            ..album.name = 'bar'
            ..duration = Duration()),
        ),
      ));

      expect(find.text('bar'), findsOneWidget);
    });
  });
  testWidgets('displays duration', (t) async {
    mockNetworkImagesFor(() async {
      await t.pumpWidget(shell<String>(
        child: SongDetailsRow(
          song: Song((b) => b
            ..title = 'foo'
            ..album.name = 'bar'
            ..duration = Duration(minutes: 3, seconds: 8)),
        ),
      ));

      expect(find.text('3:08'), findsOneWidget);
    });
  });
}
