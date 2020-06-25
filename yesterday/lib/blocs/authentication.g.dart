// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoginButtonPressed> _$loginButtonPressedSerializer =
    new _$LoginButtonPressedSerializer();
Serializer<AuthenticationInitial<Object>> _$authenticationInitialSerializer =
    new _$AuthenticationInitialSerializer();
Serializer<AuthenticationStarted<Object>> _$authenticationStartedSerializer =
    new _$AuthenticationStartedSerializer();

class _$LoginButtonPressedSerializer
    implements StructuredSerializer<LoginButtonPressed> {
  @override
  final Iterable<Type> types = const [LoginButtonPressed, _$LoginButtonPressed];
  @override
  final String wireName = 'LoginButtonPressed';

  @override
  Iterable<Object> serialize(Serializers serializers, LoginButtonPressed object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  LoginButtonPressed deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new LoginButtonPressedBuilder().build();
  }
}

class _$AuthenticationInitialSerializer
    implements StructuredSerializer<AuthenticationInitial<Object>> {
  @override
  final Iterable<Type> types = const [
    AuthenticationInitial,
    _$AuthenticationInitial
  ];
  @override
  final String wireName = 'AuthenticationInitial';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AuthenticationInitial<Object> object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  AuthenticationInitial<Object> deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new AuthenticationInitialBuilder().build();
  }
}

class _$AuthenticationStartedSerializer
    implements StructuredSerializer<AuthenticationStarted<Object>> {
  @override
  final Iterable<Type> types = const [
    AuthenticationStarted,
    _$AuthenticationStarted
  ];
  @override
  final String wireName = 'AuthenticationStarted';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AuthenticationStarted<Object> object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  AuthenticationStarted<Object> deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new AuthenticationStartedBuilder().build();
  }
}

class _$LoginButtonPressed extends LoginButtonPressed {
  factory _$LoginButtonPressed(
          [void Function(LoginButtonPressedBuilder) updates]) =>
      (new LoginButtonPressedBuilder()..update(updates)).build();

  _$LoginButtonPressed._() : super._();

  @override
  LoginButtonPressed rebuild(
          void Function(LoginButtonPressedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginButtonPressedBuilder toBuilder() =>
      new LoginButtonPressedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginButtonPressed;
  }

  @override
  int get hashCode {
    return 362108614;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('LoginButtonPressed').toString();
  }
}

class LoginButtonPressedBuilder
    implements Builder<LoginButtonPressed, LoginButtonPressedBuilder> {
  _$LoginButtonPressed _$v;

  LoginButtonPressedBuilder();

  @override
  void replace(LoginButtonPressed other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginButtonPressed;
  }

  @override
  void update(void Function(LoginButtonPressedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginButtonPressed build() {
    final _$result = _$v ?? new _$LoginButtonPressed._();
    replace(_$result);
    return _$result;
  }
}

class _$AuthenticationInitial<T> extends AuthenticationInitial<T> {
  factory _$AuthenticationInitial(
          [void Function(AuthenticationInitialBuilder<T>) updates]) =>
      (new AuthenticationInitialBuilder<T>()..update(updates)).build();

  _$AuthenticationInitial._() : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('AuthenticationInitial', 'T');
    }
  }

  @override
  AuthenticationInitial<T> rebuild(
          void Function(AuthenticationInitialBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticationInitialBuilder<T> toBuilder() =>
      new AuthenticationInitialBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticationInitial;
  }

  @override
  int get hashCode {
    return 456599766;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('AuthenticationInitial').toString();
  }
}

class AuthenticationInitialBuilder<T>
    implements
        Builder<AuthenticationInitial<T>, AuthenticationInitialBuilder<T>> {
  _$AuthenticationInitial<T> _$v;

  AuthenticationInitialBuilder();

  @override
  void replace(AuthenticationInitial<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthenticationInitial<T>;
  }

  @override
  void update(void Function(AuthenticationInitialBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthenticationInitial<T> build() {
    final _$result = _$v ?? new _$AuthenticationInitial<T>._();
    replace(_$result);
    return _$result;
  }
}

class _$AuthenticationStarted<T> extends AuthenticationStarted<T> {
  factory _$AuthenticationStarted(
          [void Function(AuthenticationStartedBuilder<T>) updates]) =>
      (new AuthenticationStartedBuilder<T>()..update(updates)).build();

  _$AuthenticationStarted._() : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('AuthenticationStarted', 'T');
    }
  }

  @override
  AuthenticationStarted<T> rebuild(
          void Function(AuthenticationStartedBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticationStartedBuilder<T> toBuilder() =>
      new AuthenticationStartedBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticationStarted;
  }

  @override
  int get hashCode {
    return 440179892;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('AuthenticationStarted').toString();
  }
}

class AuthenticationStartedBuilder<T>
    implements
        Builder<AuthenticationStarted<T>, AuthenticationStartedBuilder<T>> {
  _$AuthenticationStarted<T> _$v;

  AuthenticationStartedBuilder();

  @override
  void replace(AuthenticationStarted<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthenticationStarted<T>;
  }

  @override
  void update(void Function(AuthenticationStartedBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthenticationStarted<T> build() {
    final _$result = _$v ?? new _$AuthenticationStarted<T>._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
