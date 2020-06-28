// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_bloc.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserLoggedIn<Object>> _$userLoggedInSerializer =
    new _$UserLoggedInSerializer();
Serializer<AuthenticationInitial<Object>> _$authenticationInitialSerializer =
    new _$AuthenticationInitialSerializer();
Serializer<AuthenticationLoading<Object>> _$authenticationLoadingSerializer =
    new _$AuthenticationLoadingSerializer();
Serializer<AuthenticationUnauthenticated<Object>>
    _$authenticationUnauthenticatedSerializer =
    new _$AuthenticationUnauthenticatedSerializer();
Serializer<AuthenticationAuthenticated<Object>>
    _$authenticationAuthenticatedSerializer =
    new _$AuthenticationAuthenticatedSerializer();
Serializer<AuthenticationFailure<Object>> _$authenticationFailureSerializer =
    new _$AuthenticationFailureSerializer();

class _$UserLoggedInSerializer
    implements StructuredSerializer<UserLoggedIn<Object>> {
  @override
  final Iterable<Type> types = const [UserLoggedIn, _$UserLoggedIn];
  @override
  final String wireName = 'UserLoggedIn';

  @override
  Iterable<Object> serialize(
      Serializers serializers, UserLoggedIn<Object> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object>[
      'user',
      serializers.serialize(object.user, specifiedType: parameterT),
    ];

    return result;
  }

  @override
  UserLoggedIn<Object> deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new UserLoggedInBuilder<Object>()
        : serializers.newBuilder(specifiedType) as UserLoggedInBuilder;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'user':
          result.user =
              serializers.deserialize(value, specifiedType: parameterT);
          break;
      }
    }

    return result.build();
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

class _$AuthenticationLoadingSerializer
    implements StructuredSerializer<AuthenticationLoading<Object>> {
  @override
  final Iterable<Type> types = const [
    AuthenticationLoading,
    _$AuthenticationLoading
  ];
  @override
  final String wireName = 'AuthenticationLoading';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AuthenticationLoading<Object> object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  AuthenticationLoading<Object> deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new AuthenticationLoadingBuilder().build();
  }
}

class _$AuthenticationUnauthenticatedSerializer
    implements StructuredSerializer<AuthenticationUnauthenticated<Object>> {
  @override
  final Iterable<Type> types = const [
    AuthenticationUnauthenticated,
    _$AuthenticationUnauthenticated
  ];
  @override
  final String wireName = 'AuthenticationUnauthenticated';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AuthenticationUnauthenticated<Object> object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  AuthenticationUnauthenticated<Object> deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new AuthenticationUnauthenticatedBuilder().build();
  }
}

class _$AuthenticationAuthenticatedSerializer
    implements StructuredSerializer<AuthenticationAuthenticated<Object>> {
  @override
  final Iterable<Type> types = const [
    AuthenticationAuthenticated,
    _$AuthenticationAuthenticated
  ];
  @override
  final String wireName = 'AuthenticationAuthenticated';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AuthenticationAuthenticated<Object> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object>[
      'user',
      serializers.serialize(object.user, specifiedType: parameterT),
    ];

    return result;
  }

  @override
  AuthenticationAuthenticated<Object> deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new AuthenticationAuthenticatedBuilder<Object>()
        : serializers.newBuilder(specifiedType)
            as AuthenticationAuthenticatedBuilder;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'user':
          result.user =
              serializers.deserialize(value, specifiedType: parameterT);
          break;
      }
    }

    return result.build();
  }
}

class _$AuthenticationFailureSerializer
    implements StructuredSerializer<AuthenticationFailure<Object>> {
  @override
  final Iterable<Type> types = const [
    AuthenticationFailure,
    _$AuthenticationFailure
  ];
  @override
  final String wireName = 'AuthenticationFailure';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AuthenticationFailure<Object> object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  AuthenticationFailure<Object> deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthenticationFailureBuilder();

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

class _$UserLoggedIn<T> extends UserLoggedIn<T> {
  @override
  final T user;

  factory _$UserLoggedIn([void Function(UserLoggedInBuilder<T>) updates]) =>
      (new UserLoggedInBuilder<T>()..update(updates)).build();

  _$UserLoggedIn._({this.user}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('UserLoggedIn', 'user');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('UserLoggedIn', 'T');
    }
  }

  @override
  UserLoggedIn<T> rebuild(void Function(UserLoggedInBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserLoggedInBuilder<T> toBuilder() =>
      new UserLoggedInBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserLoggedIn && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserLoggedIn')..add('user', user))
        .toString();
  }
}

class UserLoggedInBuilder<T>
    implements Builder<UserLoggedIn<T>, UserLoggedInBuilder<T>> {
  _$UserLoggedIn<T> _$v;

  T _user;
  T get user => _$this._user;
  set user(T user) => _$this._user = user;

  UserLoggedInBuilder();

  UserLoggedInBuilder<T> get _$this {
    if (_$v != null) {
      _user = _$v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserLoggedIn<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserLoggedIn<T>;
  }

  @override
  void update(void Function(UserLoggedInBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserLoggedIn<T> build() {
    final _$result = _$v ?? new _$UserLoggedIn<T>._(user: user);
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

class _$AuthenticationLoading<T> extends AuthenticationLoading<T> {
  factory _$AuthenticationLoading(
          [void Function(AuthenticationLoadingBuilder<T>) updates]) =>
      (new AuthenticationLoadingBuilder<T>()..update(updates)).build();

  _$AuthenticationLoading._() : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('AuthenticationLoading', 'T');
    }
  }

  @override
  AuthenticationLoading<T> rebuild(
          void Function(AuthenticationLoadingBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticationLoadingBuilder<T> toBuilder() =>
      new AuthenticationLoadingBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticationLoading;
  }

  @override
  int get hashCode {
    return 959899924;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('AuthenticationLoading').toString();
  }
}

class AuthenticationLoadingBuilder<T>
    implements
        Builder<AuthenticationLoading<T>, AuthenticationLoadingBuilder<T>> {
  _$AuthenticationLoading<T> _$v;

  AuthenticationLoadingBuilder();

  @override
  void replace(AuthenticationLoading<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthenticationLoading<T>;
  }

  @override
  void update(void Function(AuthenticationLoadingBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthenticationLoading<T> build() {
    final _$result = _$v ?? new _$AuthenticationLoading<T>._();
    replace(_$result);
    return _$result;
  }
}

class _$AuthenticationUnauthenticated<T>
    extends AuthenticationUnauthenticated<T> {
  factory _$AuthenticationUnauthenticated(
          [void Function(AuthenticationUnauthenticatedBuilder<T>) updates]) =>
      (new AuthenticationUnauthenticatedBuilder<T>()..update(updates)).build();

  _$AuthenticationUnauthenticated._() : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(
          'AuthenticationUnauthenticated', 'T');
    }
  }

  @override
  AuthenticationUnauthenticated<T> rebuild(
          void Function(AuthenticationUnauthenticatedBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticationUnauthenticatedBuilder<T> toBuilder() =>
      new AuthenticationUnauthenticatedBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticationUnauthenticated;
  }

  @override
  int get hashCode {
    return 1069935541;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('AuthenticationUnauthenticated')
        .toString();
  }
}

class AuthenticationUnauthenticatedBuilder<T>
    implements
        Builder<AuthenticationUnauthenticated<T>,
            AuthenticationUnauthenticatedBuilder<T>> {
  _$AuthenticationUnauthenticated<T> _$v;

  AuthenticationUnauthenticatedBuilder();

  @override
  void replace(AuthenticationUnauthenticated<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthenticationUnauthenticated<T>;
  }

  @override
  void update(void Function(AuthenticationUnauthenticatedBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthenticationUnauthenticated<T> build() {
    final _$result = _$v ?? new _$AuthenticationUnauthenticated<T>._();
    replace(_$result);
    return _$result;
  }
}

class _$AuthenticationAuthenticated<T> extends AuthenticationAuthenticated<T> {
  @override
  final T user;

  factory _$AuthenticationAuthenticated(
          [void Function(AuthenticationAuthenticatedBuilder<T>) updates]) =>
      (new AuthenticationAuthenticatedBuilder<T>()..update(updates)).build();

  _$AuthenticationAuthenticated._({this.user}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('AuthenticationAuthenticated', 'user');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(
          'AuthenticationAuthenticated', 'T');
    }
  }

  @override
  AuthenticationAuthenticated<T> rebuild(
          void Function(AuthenticationAuthenticatedBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticationAuthenticatedBuilder<T> toBuilder() =>
      new AuthenticationAuthenticatedBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticationAuthenticated && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthenticationAuthenticated')
          ..add('user', user))
        .toString();
  }
}

class AuthenticationAuthenticatedBuilder<T>
    implements
        Builder<AuthenticationAuthenticated<T>,
            AuthenticationAuthenticatedBuilder<T>> {
  _$AuthenticationAuthenticated<T> _$v;

  T _user;
  T get user => _$this._user;
  set user(T user) => _$this._user = user;

  AuthenticationAuthenticatedBuilder();

  AuthenticationAuthenticatedBuilder<T> get _$this {
    if (_$v != null) {
      _user = _$v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthenticationAuthenticated<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthenticationAuthenticated<T>;
  }

  @override
  void update(void Function(AuthenticationAuthenticatedBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthenticationAuthenticated<T> build() {
    final _$result = _$v ?? new _$AuthenticationAuthenticated<T>._(user: user);
    replace(_$result);
    return _$result;
  }
}

class _$AuthenticationFailure<T> extends AuthenticationFailure<T> {
  @override
  final String message;

  factory _$AuthenticationFailure(
          [void Function(AuthenticationFailureBuilder<T>) updates]) =>
      (new AuthenticationFailureBuilder<T>()..update(updates)).build();

  _$AuthenticationFailure._({this.message}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('AuthenticationFailure', 'message');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('AuthenticationFailure', 'T');
    }
  }

  @override
  AuthenticationFailure<T> rebuild(
          void Function(AuthenticationFailureBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticationFailureBuilder<T> toBuilder() =>
      new AuthenticationFailureBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticationFailure && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthenticationFailure')
          ..add('message', message))
        .toString();
  }
}

class AuthenticationFailureBuilder<T>
    implements
        Builder<AuthenticationFailure<T>, AuthenticationFailureBuilder<T>> {
  _$AuthenticationFailure<T> _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  AuthenticationFailureBuilder();

  AuthenticationFailureBuilder<T> get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthenticationFailure<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthenticationFailure<T>;
  }

  @override
  void update(void Function(AuthenticationFailureBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthenticationFailure<T> build() {
    final _$result = _$v ?? new _$AuthenticationFailure<T>._(message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
