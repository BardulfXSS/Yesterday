import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/models/models.dart';

void main() {
  group('thumbnail', () {
    test('returns default thumbnail if no albumArtUrl', () {
      final NetworkImage img = Song().thumbnail.image;
      final NetworkImage defaultImg = Playlist.defaultThumbnail.image;

      expect(img.url, defaultImg.url);
    });
    test('returns network image from albumArtUrl', () {
      final url = 'https://i.pinimg.com/originals/da/18/3e/'
          'da183e46c3de1eaefa4f6705ca9a50dd.jpg';
      final NetworkImage img = Song((b) => b.albumArtUrl = url).thumbnail.image;

      expect(img.url, url);
    });
  });
}
