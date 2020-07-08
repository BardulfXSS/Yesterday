import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/widgets.dart' hide Builder;
import 'package:yesterday/models/models.dart';
import 'package:yesterday/serializers.dart';

part 'song.g.dart';

abstract class Song implements Built<Song, SongBuilder> {
  String get title;
  @nullable
  Artist get artist;
  @nullable
  Album get album;
  Duration get duration;

  Image get thumbnail => album?.thumbnail ?? Playlist.defaultThumbnail;

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
