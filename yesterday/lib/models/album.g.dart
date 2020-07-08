// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Album> _$albumSerializer = new _$AlbumSerializer();

class _$AlbumSerializer implements StructuredSerializer<Album> {
  @override
  final Iterable<Type> types = const [Album, _$Album];
  @override
  final String wireName = 'Album';

  @override
  Iterable<Object> serialize(Serializers serializers, Album object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'tracks',
      serializers.serialize(object.tracks,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Song)])),
    ];
    if (object.artist != null) {
      result
        ..add('artist')
        ..add(serializers.serialize(object.artist,
            specifiedType: const FullType(Artist)));
    }
    if (object.coverArtUrl != null) {
      result
        ..add('coverArtUrl')
        ..add(serializers.serialize(object.coverArtUrl,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Album deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AlbumBuilder();

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
        case 'artist':
          result.artist.replace(serializers.deserialize(value,
              specifiedType: const FullType(Artist)) as Artist);
          break;
        case 'coverArtUrl':
          result.coverArtUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tracks':
          result.tracks.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Song)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$Album extends Album {
  @override
  final String name;
  @override
  final Artist artist;
  @override
  final String coverArtUrl;
  @override
  final BuiltList<Song> tracks;

  factory _$Album([void Function(AlbumBuilder) updates]) =>
      (new AlbumBuilder()..update(updates)).build();

  _$Album._({this.name, this.artist, this.coverArtUrl, this.tracks})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Album', 'name');
    }
    if (tracks == null) {
      throw new BuiltValueNullFieldError('Album', 'tracks');
    }
  }

  @override
  Album rebuild(void Function(AlbumBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AlbumBuilder toBuilder() => new AlbumBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Album &&
        name == other.name &&
        artist == other.artist &&
        coverArtUrl == other.coverArtUrl &&
        tracks == other.tracks;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), artist.hashCode), coverArtUrl.hashCode),
        tracks.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Album')
          ..add('name', name)
          ..add('artist', artist)
          ..add('coverArtUrl', coverArtUrl)
          ..add('tracks', tracks))
        .toString();
  }
}

class AlbumBuilder implements Builder<Album, AlbumBuilder> {
  _$Album _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ArtistBuilder _artist;
  ArtistBuilder get artist => _$this._artist ??= new ArtistBuilder();
  set artist(ArtistBuilder artist) => _$this._artist = artist;

  String _coverArtUrl;
  String get coverArtUrl => _$this._coverArtUrl;
  set coverArtUrl(String coverArtUrl) => _$this._coverArtUrl = coverArtUrl;

  ListBuilder<Song> _tracks;
  ListBuilder<Song> get tracks => _$this._tracks ??= new ListBuilder<Song>();
  set tracks(ListBuilder<Song> tracks) => _$this._tracks = tracks;

  AlbumBuilder();

  AlbumBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _artist = _$v.artist?.toBuilder();
      _coverArtUrl = _$v.coverArtUrl;
      _tracks = _$v.tracks?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Album other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Album;
  }

  @override
  void update(void Function(AlbumBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Album build() {
    _$Album _$result;
    try {
      _$result = _$v ??
          new _$Album._(
              name: name,
              artist: _artist?.build(),
              coverArtUrl: coverArtUrl,
              tracks: tracks.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'artist';
        _artist?.build();

        _$failedField = 'tracks';
        tracks.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Album', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
