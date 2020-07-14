// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MusicData> _$musicDataSerializer = new _$MusicDataSerializer();

class _$MusicDataSerializer implements StructuredSerializer<MusicData> {
  @override
  final Iterable<Type> types = const [MusicData, _$MusicData];
  @override
  final String wireName = 'MusicData';

  @override
  Iterable<Object> serialize(Serializers serializers, MusicData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'artists',
      serializers.serialize(object.artists,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Artist)])),
      'playlists',
      serializers.serialize(object.playlists,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Playlist)])),
      'songs',
      serializers.serialize(object.songs,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Song)])),
    ];

    return result;
  }

  @override
  MusicData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MusicDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'artists':
          result.artists.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Artist)]))
              as BuiltList<Object>);
          break;
        case 'playlists':
          result.playlists.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Playlist)]))
              as BuiltList<Object>);
          break;
        case 'songs':
          result.songs.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Song)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$MusicData extends MusicData {
  @override
  final BuiltList<Artist> artists;
  @override
  final BuiltList<Playlist> playlists;
  @override
  final BuiltList<Song> songs;

  factory _$MusicData([void Function(MusicDataBuilder) updates]) =>
      (new MusicDataBuilder()..update(updates)).build();

  _$MusicData._({this.artists, this.playlists, this.songs}) : super._() {
    if (artists == null) {
      throw new BuiltValueNullFieldError('MusicData', 'artists');
    }
    if (playlists == null) {
      throw new BuiltValueNullFieldError('MusicData', 'playlists');
    }
    if (songs == null) {
      throw new BuiltValueNullFieldError('MusicData', 'songs');
    }
  }

  @override
  MusicData rebuild(void Function(MusicDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MusicDataBuilder toBuilder() => new MusicDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MusicData &&
        artists == other.artists &&
        playlists == other.playlists &&
        songs == other.songs;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, artists.hashCode), playlists.hashCode), songs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MusicData')
          ..add('artists', artists)
          ..add('playlists', playlists)
          ..add('songs', songs))
        .toString();
  }
}

class MusicDataBuilder implements Builder<MusicData, MusicDataBuilder> {
  _$MusicData _$v;

  ListBuilder<Artist> _artists;
  ListBuilder<Artist> get artists =>
      _$this._artists ??= new ListBuilder<Artist>();
  set artists(ListBuilder<Artist> artists) => _$this._artists = artists;

  ListBuilder<Playlist> _playlists;
  ListBuilder<Playlist> get playlists =>
      _$this._playlists ??= new ListBuilder<Playlist>();
  set playlists(ListBuilder<Playlist> playlists) =>
      _$this._playlists = playlists;

  ListBuilder<Song> _songs;
  ListBuilder<Song> get songs => _$this._songs ??= new ListBuilder<Song>();
  set songs(ListBuilder<Song> songs) => _$this._songs = songs;

  MusicDataBuilder();

  MusicDataBuilder get _$this {
    if (_$v != null) {
      _artists = _$v.artists?.toBuilder();
      _playlists = _$v.playlists?.toBuilder();
      _songs = _$v.songs?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MusicData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MusicData;
  }

  @override
  void update(void Function(MusicDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MusicData build() {
    _$MusicData _$result;
    try {
      _$result = _$v ??
          new _$MusicData._(
              artists: artists.build(),
              playlists: playlists.build(),
              songs: songs.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'artists';
        artists.build();
        _$failedField = 'playlists';
        playlists.build();
        _$failedField = 'songs';
        songs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MusicData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
