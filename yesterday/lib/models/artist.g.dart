// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Artist> _$artistSerializer = new _$ArtistSerializer();

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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
