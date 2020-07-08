import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:yesterday/models/models.dart';
import 'package:yesterday/serializers.dart';

part 'playlist.g.dart';

abstract class Playlist implements Built<Playlist, PlaylistBuilder> {
  String get name;
  BuiltList<Song> get songs;

  static Image get defaultThumbnail =>
      Image.network('https://via.placeholder.com/150');
  Widget get thumbnail => FutureBuilder<List<Image>>(
        future: Stream.fromIterable(songs)
            .where((s) => s.album?.coverArtUrl != null)
            .distinct((s, s2) => s.album?.coverArtUrl == s2.album?.coverArtUrl)
            .take(4)
            .map((s) => s.thumbnail)
            .toList(),
        builder: (_, s) {
          if (s.hasData) {
            final thumbs = s.data;
            if (thumbs.isEmpty) {
              return defaultThumbnail;
            } else if (thumbs.length == 4) {
              return AspectRatio(
                aspectRatio: 1,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: thumbs.map((t) => GridTile(child: t)).toList(),
                ),
              );
            } else {
              return thumbs.first;
            }
          } else {
            return defaultThumbnail;
          }
        },
      );

  Playlist._();
  factory Playlist([void Function(PlaylistBuilder) updates]) = _$Playlist;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Playlist.serializer, this);
  }

  static Playlist fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Playlist.serializer, json);
  }

  static Serializer<Playlist> get serializer => _$playlistSerializer;
}
