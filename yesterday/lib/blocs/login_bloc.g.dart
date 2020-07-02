// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_bloc.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginWithEmailPassword extends LoginWithEmailPassword {
  @override
  final String email;
  @override
  final String password;

  factory _$LoginWithEmailPassword(
          [void Function(LoginWithEmailPasswordBuilder) updates]) =>
      (new LoginWithEmailPasswordBuilder()..update(updates)).build();

  _$LoginWithEmailPassword._({this.email, this.password}) : super._() {
    if (email == null) {
      throw new BuiltValueNullFieldError('LoginWithEmailPassword', 'email');
    }
    if (password == null) {
      throw new BuiltValueNullFieldError('LoginWithEmailPassword', 'password');
    }
  }

  @override
  LoginWithEmailPassword rebuild(
          void Function(LoginWithEmailPasswordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginWithEmailPasswordBuilder toBuilder() =>
      new LoginWithEmailPasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginWithEmailPassword &&
        email == other.email &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, email.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginWithEmailPassword')
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class LoginWithEmailPasswordBuilder
    implements Builder<LoginWithEmailPassword, LoginWithEmailPasswordBuilder> {
  _$LoginWithEmailPassword _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  LoginWithEmailPasswordBuilder();

  LoginWithEmailPasswordBuilder get _$this {
    if (_$v != null) {
      _email = _$v.email;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginWithEmailPassword other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginWithEmailPassword;
  }

  @override
  void update(void Function(LoginWithEmailPasswordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginWithEmailPassword build() {
    final _$result =
        _$v ?? new _$LoginWithEmailPassword._(email: email, password: password);
    replace(_$result);
    return _$result;
  }
}

class _$LoginInitial<T> extends LoginInitial<T> {
  factory _$LoginInitial([void Function(LoginInitialBuilder<T>) updates]) =>
      (new LoginInitialBuilder<T>()..update(updates)).build();

  _$LoginInitial._() : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('LoginInitial', 'T');
    }
  }

  @override
  LoginInitial<T> rebuild(void Function(LoginInitialBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginInitialBuilder<T> toBuilder() =>
      new LoginInitialBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginInitial;
  }

  @override
  int get hashCode {
    return 864398879;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('LoginInitial').toString();
  }
}

class LoginInitialBuilder<T>
    implements Builder<LoginInitial<T>, LoginInitialBuilder<T>> {
  _$LoginInitial<T> _$v;

  LoginInitialBuilder();

  @override
  void replace(LoginInitial<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginInitial<T>;
  }

  @override
  void update(void Function(LoginInitialBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginInitial<T> build() {
    final _$result = _$v ?? new _$LoginInitial<T>._();
    replace(_$result);
    return _$result;
  }
}

class _$LoginLoading<T> extends LoginLoading<T> {
  factory _$LoginLoading([void Function(LoginLoadingBuilder<T>) updates]) =>
      (new LoginLoadingBuilder<T>()..update(updates)).build();

  _$LoginLoading._() : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('LoginLoading', 'T');
    }
  }

  @override
  LoginLoading<T> rebuild(void Function(LoginLoadingBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginLoadingBuilder<T> toBuilder() =>
      new LoginLoadingBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginLoading;
  }

  @override
  int get hashCode {
    return 75875038;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('LoginLoading').toString();
  }
}

class LoginLoadingBuilder<T>
    implements Builder<LoginLoading<T>, LoginLoadingBuilder<T>> {
  _$LoginLoading<T> _$v;

  LoginLoadingBuilder();

  @override
  void replace(LoginLoading<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginLoading<T>;
  }

  @override
  void update(void Function(LoginLoadingBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginLoading<T> build() {
    final _$result = _$v ?? new _$LoginLoading<T>._();
    replace(_$result);
    return _$result;
  }
}

class _$LoginSuccess<T> extends LoginSuccess<T> {
  @override
  final T user;

  factory _$LoginSuccess([void Function(LoginSuccessBuilder<T>) updates]) =>
      (new LoginSuccessBuilder<T>()..update(updates)).build();

  _$LoginSuccess._({this.user}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('LoginSuccess', 'user');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('LoginSuccess', 'T');
    }
  }

  @override
  LoginSuccess<T> rebuild(void Function(LoginSuccessBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginSuccessBuilder<T> toBuilder() =>
      new LoginSuccessBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginSuccess && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginSuccess')..add('user', user))
        .toString();
  }
}

class LoginSuccessBuilder<T>
    implements Builder<LoginSuccess<T>, LoginSuccessBuilder<T>> {
  _$LoginSuccess<T> _$v;

  T _user;
  T get user => _$this._user;
  set user(T user) => _$this._user = user;

  LoginSuccessBuilder();

  LoginSuccessBuilder<T> get _$this {
    if (_$v != null) {
      _user = _$v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginSuccess<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginSuccess<T>;
  }

  @override
  void update(void Function(LoginSuccessBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginSuccess<T> build() {
    final _$result = _$v ?? new _$LoginSuccess<T>._(user: user);
    replace(_$result);
    return _$result;
  }
}

class _$LoginFailure<T> extends LoginFailure<T> {
  @override
  final String error;

  factory _$LoginFailure([void Function(LoginFailureBuilder<T>) updates]) =>
      (new LoginFailureBuilder<T>()..update(updates)).build();

  _$LoginFailure._({this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('LoginFailure', 'error');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('LoginFailure', 'T');
    }
  }

  @override
  LoginFailure<T> rebuild(void Function(LoginFailureBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginFailureBuilder<T> toBuilder() =>
      new LoginFailureBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginFailure && error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(0, error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginFailure')..add('error', error))
        .toString();
  }
}

class LoginFailureBuilder<T>
    implements Builder<LoginFailure<T>, LoginFailureBuilder<T>> {
  _$LoginFailure<T> _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  LoginFailureBuilder();

  LoginFailureBuilder<T> get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginFailure<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginFailure<T>;
  }

  @override
  void update(void Function(LoginFailureBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginFailure<T> build() {
    final _$result = _$v ?? new _$LoginFailure<T>._(error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
