import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:yesterday/models/models.dart';
import 'package:yesterday/serializers.dart';

part 'music.g.dart';

abstract class Song implements Built<Song, SongBuilder> {
  String get title;
  @nullable
  Artist get artist;
  @nullable
  Album get album;
  Duration get duration;

  Image get thumbnail => album?.thumbnail ?? Album.defaultThumbnail;

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

abstract class Artist implements Built<Artist, ArtistBuilder>, TileContent {
  String get name;
  BuiltList<Album> get albums;
  Widget get thumbnail => albumThumbnailGroup(albums);

  Artist._();
  factory Artist([void Function(ArtistBuilder) updates]) = _$Artist;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Artist.serializer, this);
  }

  static Artist fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Artist.serializer, json);
  }

  static Serializer<Artist> get serializer => _$artistSerializer;
}

abstract class Album implements Built<Album, AlbumBuilder>, TileContent {
  String get name;
  @nullable
  Artist get artist;
  @nullable
  String get coverArtUrl;
  BuiltList<Song> get tracks;

  static Image get defaultThumbnail =>
      Image.network('https://via.placeholder.com/150');
  Image get thumbnail =>
      coverArtUrl != null ? Image.network(coverArtUrl) : defaultThumbnail;

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

abstract class Playlist
    implements Built<Playlist, PlaylistBuilder>, TileContent {
  String get name;
  BuiltList<Song> get songs;

  Widget get thumbnail => albumThumbnailGroup(
      songs.where((s) => s.album != null).map((s) => s.album));

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

Widget albumThumbnailGroup(Iterable<Album> albums) {
  final thumbs =
      LinkedHashSet<Album>.from(albums.where((a) => a.coverArtUrl != null))
          .toList()
          .take(4)
          .map((a) => a.thumbnail)
          .toList();

  if (thumbs.isEmpty) {
    return Album.defaultThumbnail;
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
}
