import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/widgets.dart' hide Builder;
import 'package:yesterday/models/models.dart';
import 'package:yesterday/serializers.dart';

part 'album.g.dart';

abstract class Album implements Built<Album, AlbumBuilder> {
  String get name;
  @nullable
  Artist get artist;
  @nullable
  String get coverArtUrl;
  BuiltList<Song> get tracks;

  Image get thumbnail => coverArtUrl != null
      ? Image.network(coverArtUrl)
      : Playlist.defaultThumbnail;

  Album._();
  factory Album([void Function(AlbumBuilder) updates]) = _$Album;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Album.serializer, this);
  }

  static Album fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Album.serializer, json);
  }

  static Serializer<Album> get serializer => _$albumSerializer;
}
