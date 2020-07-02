// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Playlist> _$playlistSerializer = new _$PlaylistSerializer();

class _$PlaylistSerializer implements StructuredSerializer<Playlist> {
  @override
  final Iterable<Type> types = const [Playlist, _$Playlist];
  @override
  final String wireName = 'Playlist';

  @override
  Iterable<Object> serialize(Serializers serializers, Playlist object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'songs',
      serializers.serialize(object.songs,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Song)])),
    ];

    return result;
  }

  @override
  Playlist deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlaylistBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$Playlist extends Playlist {
  @override
  final String name;
  @override
  final BuiltList<Song> songs;

  factory _$Playlist([void Function(PlaylistBuilder) updates]) =>
      (new PlaylistBuilder()..update(updates)).build();

  _$Playlist._({this.name, this.songs}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Playlist', 'name');
    }
    if (songs == null) {
      throw new BuiltValueNullFieldError('Playlist', 'songs');
    }
  }

  @override
  Playlist rebuild(void Function(PlaylistBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlaylistBuilder toBuilder() => new PlaylistBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Playlist && name == other.name && songs == other.songs;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), songs.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Playlist')
          ..add('name', name)
          ..add('songs', songs))
        .toString();
  }
}

class PlaylistBuilder implements Builder<Playlist, PlaylistBuilder> {
  _$Playlist _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<Song> _songs;
  ListBuilder<Song> get songs => _$this._songs ??= new ListBuilder<Song>();
  set songs(ListBuilder<Song> songs) => _$this._songs = songs;

  PlaylistBuilder();

  PlaylistBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _songs = _$v.songs?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Playlist other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Playlist;
  }

  @override
  void update(void Function(PlaylistBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Playlist build() {
    _$Playlist _$result;
    try {
      _$result = _$v ?? new _$Playlist._(name: name, songs: songs.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'songs';
        songs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Playlist', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
