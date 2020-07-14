import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/tile/tile.dart';

import '../../test.dart';

void main() => group('AlbumThumbnail', () {
      testWidgets("displays song thumbnail", (t) async {
        mockNetworkImagesFor(() async {
          final url = 'foo.com/bar';
          await t.pumpWidget(shell<String>(
            child: AlbumThumbnail(
              song: Song((b) => b
                ..title = 'foo'
                ..album.update((b) => b
                  ..name = 'bar'
                  ..coverArtUrl = url)
                ..duration = Duration()),
            ),
          ));

          final NetworkImage thumb = t.widget<Image>(find.byType(Image)).image;
          expect(thumb.url, url);
        });
      });
    });
