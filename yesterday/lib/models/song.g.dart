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
    final result = <Object>[];
    if (object.albumArtUrl != null) {
      result
        ..add('albumArtUrl')
        ..add(serializers.serialize(object.albumArtUrl,
            specifiedType: const FullType(String)));
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
        case 'albumArtUrl':
          result.albumArtUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Song extends Song {
  @override
  final String albumArtUrl;

  factory _$Song([void Function(SongBuilder) updates]) =>
      (new SongBuilder()..update(updates)).build();

  _$Song._({this.albumArtUrl}) : super._();

  @override
  Song rebuild(void Function(SongBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SongBuilder toBuilder() => new SongBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Song && albumArtUrl == other.albumArtUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(0, albumArtUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Song')
          ..add('albumArtUrl', albumArtUrl))
        .toString();
  }
}

class SongBuilder implements Builder<Song, SongBuilder> {
  _$Song _$v;

  String _albumArtUrl;
  String get albumArtUrl => _$this._albumArtUrl;
  set albumArtUrl(String albumArtUrl) => _$this._albumArtUrl = albumArtUrl;

  SongBuilder();

  SongBuilder get _$this {
    if (_$v != null) {
      _albumArtUrl = _$v.albumArtUrl;
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
    final _$result = _$v ?? new _$Song._(albumArtUrl: albumArtUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
