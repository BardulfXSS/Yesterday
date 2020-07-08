import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/serializers.dart';

part 'artist.g.dart';

abstract class Artist implements Built<Artist, ArtistBuilder> {
  String get name;
  BuiltList<Album> get albums;

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
