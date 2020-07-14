// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_bloc.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetMusic extends GetMusic {
  @override
  final String query;

  factory _$GetMusic([void Function(GetMusicBuilder) updates]) =>
      (new GetMusicBuilder()..update(updates)).build();

  _$GetMusic._({this.query}) : super._();

  @override
  GetMusic rebuild(void Function(GetMusicBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetMusicBuilder toBuilder() => new GetMusicBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetMusic && query == other.query;
  }

  @override
  int get hashCode {
    return $jf($jc(0, query.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetMusic')..add('query', query))
        .toString();
  }
}

class GetMusicBuilder implements Builder<GetMusic, GetMusicBuilder> {
  _$GetMusic _$v;

  String _query;
  String get query => _$this._query;
  set query(String query) => _$this._query = query;

  GetMusicBuilder();

  GetMusicBuilder get _$this {
    if (_$v != null) {
      _query = _$v.query;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetMusic other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GetMusic;
  }

  @override
  void update(void Function(GetMusicBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GetMusic build() {
    final _$result = _$v ?? new _$GetMusic._(query: query);
    replace(_$result);
    return _$result;
  }
}

class _$MusicInitial extends MusicInitial {
  factory _$MusicInitial([void Function(MusicInitialBuilder) updates]) =>
      (new MusicInitialBuilder()..update(updates)).build();

  _$MusicInitial._() : super._();

  @override
  MusicInitial rebuild(void Function(MusicInitialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MusicInitialBuilder toBuilder() => new MusicInitialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MusicInitial;
  }

  @override
  int get hashCode {
    return 84782203;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('MusicInitial').toString();
  }
}

class MusicInitialBuilder
    implements Builder<MusicInitial, MusicInitialBuilder> {
  _$MusicInitial _$v;

  MusicInitialBuilder();

  @override
  void replace(MusicInitial other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MusicInitial;
  }

  @override
  void update(void Function(MusicInitialBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MusicInitial build() {
    final _$result = _$v ?? new _$MusicInitial._();
    replace(_$result);
    return _$result;
  }
}

class _$MusicLoading extends MusicLoading {
  factory _$MusicLoading([void Function(MusicLoadingBuilder) updates]) =>
      (new MusicLoadingBuilder()..update(updates)).build();

  _$MusicLoading._() : super._();

  @override
  MusicLoading rebuild(void Function(MusicLoadingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MusicLoadingBuilder toBuilder() => new MusicLoadingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MusicLoading;
  }

  @override
  int get hashCode {
    return 19238011;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('MusicLoading').toString();
  }
}

class MusicLoadingBuilder
    implements Builder<MusicLoading, MusicLoadingBuilder> {
  _$MusicLoading _$v;

  MusicLoadingBuilder();

  @override
  void replace(MusicLoading other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MusicLoading;
  }

  @override
  void update(void Function(MusicLoadingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MusicLoading build() {
    final _$result = _$v ?? new _$MusicLoading._();
    replace(_$result);
    return _$result;
  }
}

class _$MusicHasData extends MusicHasData {
  @override
  final MusicData data;

  factory _$MusicHasData([void Function(MusicHasDataBuilder) updates]) =>
      (new MusicHasDataBuilder()..update(updates)).build();

  _$MusicHasData._({this.data}) : super._() {
    if (data == null) {
      throw new BuiltValueNullFieldError('MusicHasData', 'data');
    }
  }

  @override
  MusicHasData rebuild(void Function(MusicHasDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MusicHasDataBuilder toBuilder() => new MusicHasDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MusicHasData && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MusicHasData')..add('data', data))
        .toString();
  }
}

class MusicHasDataBuilder
    implements Builder<MusicHasData, MusicHasDataBuilder> {
  _$MusicHasData _$v;

  MusicDataBuilder _data;
  MusicDataBuilder get data => _$this._data ??= new MusicDataBuilder();
  set data(MusicDataBuilder data) => _$this._data = data;

  MusicHasDataBuilder();

  MusicHasDataBuilder get _$this {
    if (_$v != null) {
      _data = _$v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MusicHasData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MusicHasData;
  }

  @override
  void update(void Function(MusicHasDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MusicHasData build() {
    _$MusicHasData _$result;
    try {
      _$result = _$v ?? new _$MusicHasData._(data: data.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MusicHasData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MusicFailure extends MusicFailure {
  @override
  final String message;

  factory _$MusicFailure([void Function(MusicFailureBuilder) updates]) =>
      (new MusicFailureBuilder()..update(updates)).build();

  _$MusicFailure._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('MusicFailure', 'message');
    }
  }

  @override
  MusicFailure rebuild(void Function(MusicFailureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MusicFailureBuilder toBuilder() => new MusicFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MusicFailure && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MusicFailure')
          ..add('message', message))
        .toString();
  }
}

class MusicFailureBuilder
    implements Builder<MusicFailure, MusicFailureBuilder> {
  _$MusicFailure _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  MusicFailureBuilder();

  MusicFailureBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MusicFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MusicFailure;
  }

  @override
  void update(void Function(MusicFailureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MusicFailure build() {
    final _$result = _$v ?? new _$MusicFailure._(message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
