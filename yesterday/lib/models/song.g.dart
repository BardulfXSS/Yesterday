// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Song> _$songSerializer = new _$SongSerializer();

class _$SongSerializer implements StructuredSerializer<Song> {
  @override
  final Iterable<Type> types = const [Song, _$Song];
  @override
  final String wireName = 'Song';

  @override
  Iterable<Object> serialize(Serializers serializers, Song object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'duration',
      serializers.serialize(object.duration,
          specifiedType: const FullType(Duration)),
    ];
    if (object.artist != null) {
      result
        ..add('artist')
        ..add(serializers.serialize(object.artist,
            specifiedType: const FullType(Artist)));
    }
    if (object.album != null) {
      result
        ..add('album')
        ..add(serializers.serialize(object.album,
            specifiedType: const FullType(Album)));
    }
    return result;
  }

  @override
  Song deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SongBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'artist':
          result.artist.replace(serializers.deserialize(value,
              specifiedType: const FullType(Artist)) as Artist);
          break;
        case 'album':
          result.album.replace(serializers.deserialize(value,
              specifiedType: const FullType(Album)) as Album);
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(Duration)) as Duration;
          break;
      }
    }

    return result.build();
  }
}

class _$Song extends Song {
  @override
  final String title;
  @override
  final Artist artist;
  @override
  final Album album;
  @override
  final Duration duration;

  factory _$Song([void Function(SongBuilder) updates]) =>
      (new SongBuilder()..update(updates)).build();

  _$Song._({this.title, this.artist, this.album, this.duration}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('Song', 'title');
    }
    if (duration == null) {
      throw new BuiltValueNullFieldError('Song', 'duration');
    }
  }

  @override
  Song rebuild(void Function(SongBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SongBuilder toBuilder() => new SongBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Song &&
        title == other.title &&
        artist == other.artist &&
        album == other.album &&
        duration == other.duration;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, title.hashCode), artist.hashCode), album.hashCode),
        duration.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Song')
          ..add('title', title)
          ..add('artist', artist)
          ..add('album', album)
          ..add('duration', duration))
        .toString();
  }
}

class SongBuilder implements Builder<Song, SongBuilder> {
  _$Song _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  ArtistBuilder _artist;
  ArtistBuilder get artist => _$this._artist ??= new ArtistBuilder();
  set artist(ArtistBuilder artist) => _$this._artist = artist;

  AlbumBuilder _album;
  AlbumBuilder get album => _$this._album ??= new AlbumBuilder();
  set album(AlbumBuilder album) => _$this._album = album;

  Duration _duration;
  Duration get duration => _$this._duration;
  set duration(Duration duration) => _$this._duration = duration;

  SongBuilder();

  SongBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _artist = _$v.artist?.toBuilder();
      _album = _$v.album?.toBuilder();
      _duration = _$v.duration;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Song other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Song;
  }

  @override
  void update(void Function(SongBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Song build() {
    _$Song _$result;
    try {
      _$result = _$v ??
          new _$Song._(
              title: title,
              artist: _artist?.build(),
              album: _album?.build(),
              duration: duration);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'artist';
        _artist?.build();
        _$failedField = 'album';
        _album?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Song', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
