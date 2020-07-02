import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/widgets.dart' hide Builder;
import 'package:yesterday/models/models.dart';
import 'package:yesterday/serializers.dart';

part 'song.g.dart';

abstract class Song implements Built<Song, SongBuilder> {
  @nullable
  String get albumArtUrl;

  Image get thumbnail => albumArtUrl != null
      ? Image.network(albumArtUrl)
      : Playlist.defaultThumbnail;

  Song._();
  factory Song([void Function(SongBuilder) updates]) = _$Song;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Song.serializer, this);
  }

  static Song fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Song.serializer, json);
  }

  static Serializer<Song> get serializer => _$songSerializer;
}
