// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_service.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthenticationError> _$authenticationErrorSerializer =
    new _$AuthenticationErrorSerializer();

class _$AuthenticationErrorSerializer
    implements StructuredSerializer<AuthenticationError> {
  @override
  final Iterable<Type> types = const [
    AuthenticationError,
    _$AuthenticationError
  ];
  @override
  final String wireName = 'AuthenticationError';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AuthenticationError object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AuthenticationError deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthenticationErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthenticationError extends AuthenticationError {
  @override
  final String message;

  factory _$AuthenticationError(
          [void Function(AuthenticationErrorBuilder) updates]) =>
      (new AuthenticationErrorBuilder()..update(updates)).build();

  _$AuthenticationError._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('AuthenticationError', 'message');
    }
  }

  @override
  AuthenticationError rebuild(
          void Function(AuthenticationErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticationErrorBuilder toBuilder() =>
      new AuthenticationErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticationError && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthenticationError')
          ..add('message', message))
        .toString();
  }
}

class AuthenticationErrorBuilder
    implements Builder<AuthenticationError, AuthenticationErrorBuilder> {
  _$AuthenticationError _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  AuthenticationErrorBuilder();

  AuthenticationErrorBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthenticationError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthenticationError;
  }

  @override
  void update(void Function(AuthenticationErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthenticationError build() {
    final _$result = _$v ?? new _$AuthenticationError._(message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
