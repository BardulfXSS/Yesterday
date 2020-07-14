// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tile.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TileGroupContent extends TileGroupContent {
  @override
  final String labelText;
  @override
  final BuiltList<TileContent> tileContents;

  factory _$TileGroupContent(
          [void Function(TileGroupContentBuilder) updates]) =>
      (new TileGroupContentBuilder()..update(updates)).build();

  _$TileGroupContent._({this.labelText, this.tileContents}) : super._() {
    if (labelText == null) {
      throw new BuiltValueNullFieldError('TileGroupContent', 'labelText');
    }
    if (tileContents == null) {
      throw new BuiltValueNullFieldError('TileGroupContent', 'tileContents');
    }
  }

  @override
  TileGroupContent rebuild(void Function(TileGroupContentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TileGroupContentBuilder toBuilder() =>
      new TileGroupContentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TileGroupContent &&
        labelText == other.labelText &&
        tileContents == other.tileContents;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, labelText.hashCode), tileContents.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TileGroupContent')
          ..add('labelText', labelText)
          ..add('tileContents', tileContents))
        .toString();
  }
}

class TileGroupContentBuilder
    implements Builder<TileGroupContent, TileGroupContentBuilder> {
  _$TileGroupContent _$v;

  String _labelText;
  String get labelText => _$this._labelText;
  set labelText(String labelText) => _$this._labelText = labelText;

  ListBuilder<TileContent> _tileContents;
  ListBuilder<TileContent> get tileContents =>
      _$this._tileContents ??= new ListBuilder<TileContent>();
  set tileContents(ListBuilder<TileContent> tileContents) =>
      _$this._tileContents = tileContents;

  TileGroupContentBuilder();

  TileGroupContentBuilder get _$this {
    if (_$v != null) {
      _labelText = _$v.labelText;
      _tileContents = _$v.tileContents?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TileGroupContent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TileGroupContent;
  }

  @override
  void update(void Function(TileGroupContentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TileGroupContent build() {
    _$TileGroupContent _$result;
    try {
      _$result = _$v ??
          new _$TileGroupContent._(
              labelText: labelText, tileContents: tileContents.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tileContents';
        tileContents.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TileGroupContent', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
