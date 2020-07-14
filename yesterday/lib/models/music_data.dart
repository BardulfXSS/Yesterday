import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/serializers.dart';

part 'music_data.g.dart';

abstract class MusicData implements Built<MusicData, MusicDataBuilder> {
  BuiltList<Artist> get artists;
  BuiltList<Playlist> get playlists;
  BuiltList<Song> get songs;

  MusicData._();
  factory MusicData([void Function(MusicDataBuilder) updates]) = _$MusicData;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MusicData.serializer, this);
  }

  static MusicData fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(MusicData.serializer, json);
  }

  static Serializer<MusicData> get serializer => _$musicDataSerializer;
}
