// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Song> _$songSerializer = new _$SongSerializer();
Serializer<Artist> _$artistSerializer = new _$ArtistSerializer();
Serializer<Album> _$albumSerializer = new _$AlbumSerializer();
Serializer<Playlist> _$playlistSerializer = new _$PlaylistSerializer();

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

class _$ArtistSerializer implements StructuredSerializer<Artist> {
  @override
  final Iterable<Type> types = const [Artist, _$Artist];
  @override
  final String wireName = 'Artist';

  @override
  Iterable<Object> serialize(Serializers serializers, Artist object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'albums',
      serializers.serialize(object.albums,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Album)])),
    ];

    return result;
  }

  @override
  Artist deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArtistBuilder();

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
        case 'albums':
          result.albums.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Album)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

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

class _$Artist extends Artist {
  @override
  final String name;
  @override
  final BuiltList<Album> albums;

  factory _$Artist([void Function(ArtistBuilder) updates]) =>
      (new ArtistBuilder()..update(updates)).build();

  _$Artist._({this.name, this.albums}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Artist', 'name');
    }
    if (albums == null) {
      throw new BuiltValueNullFieldError('Artist', 'albums');
    }
  }

  @override
  Artist rebuild(void Function(ArtistBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArtistBuilder toBuilder() => new ArtistBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Artist && name == other.name && albums == other.albums;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), albums.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Artist')
          ..add('name', name)
          ..add('albums', albums))
        .toString();
  }
}

class ArtistBuilder implements Builder<Artist, ArtistBuilder> {
  _$Artist _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<Album> _albums;
  ListBuilder<Album> get albums => _$this._albums ??= new ListBuilder<Album>();
  set albums(ListBuilder<Album> albums) => _$this._albums = albums;

  ArtistBuilder();

  ArtistBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _albums = _$v.albums?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Artist other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Artist;
  }

  @override
  void update(void Function(ArtistBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Artist build() {
    _$Artist _$result;
    try {
      _$result = _$v ?? new _$Artist._(name: name, albums: albums.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'albums';
        albums.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Artist', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
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
