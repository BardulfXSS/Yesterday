import 'package:bloc/bloc.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:yesterday/serializers.dart';

part 'authentication_bloc.g.dart';

class AuthenticationBloc<T>
    extends Bloc<AuthenticationEvent<T>, AuthenticationState<T>> {
  @override
  AuthenticationState<T> get initialState => AuthenticationInitial<T>();

  @override
  Stream<AuthenticationState<T>> mapEventToState(
      AuthenticationEvent<T> event) async* {
    if (event is UserLoggedIn<T>) {
      yield* mapUserLoggedInToState(event);
    }
  }

  Stream<AuthenticationState<T>> mapUserLoggedInToState(
      UserLoggedIn<T> event) async* {
    yield AuthenticationAuthenticated((b) => b..user = event.user);
  }
}

abstract class AuthenticationEvent<T> {}

abstract class UserLoggedIn<T>
    implements
        Built<UserLoggedIn<T>, UserLoggedInBuilder<T>>,
        AuthenticationEvent<T> {
  T get user;

  UserLoggedIn._();
  factory UserLoggedIn([void Function(UserLoggedInBuilder<T>) updates]) =
      _$UserLoggedIn<T>;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(UserLoggedIn.serializer, this);
  }

  static UserLoggedIn fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserLoggedIn.serializer, json);
  }

  static Serializer<UserLoggedIn> get serializer => _$userLoggedInSerializer;
}

abstract class AuthenticationState<T> {}

abstract class AuthenticationInitial<T>
    implements
        Built<AuthenticationInitial<T>, AuthenticationInitialBuilder<T>>,
        AuthenticationState<T> {
  AuthenticationInitial._();
  factory AuthenticationInitial(
          [void Function(AuthenticationInitialBuilder<T>) updates]) =
      _$AuthenticationInitial<T>;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AuthenticationInitial.serializer, this);
  }

  static AuthenticationInitial fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AuthenticationInitial.serializer, json);
  }

  static Serializer<AuthenticationInitial> get serializer =>
      _$authenticationInitialSerializer;
}

abstract class AuthenticationLoading<T>
    implements
        Built<AuthenticationLoading<T>, AuthenticationLoadingBuilder<T>>,
        AuthenticationState<T> {
  AuthenticationLoading._();
  factory AuthenticationLoading(
          [void Function(AuthenticationLoadingBuilder<T>) updates]) =
      _$AuthenticationLoading<T>;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AuthenticationLoading.serializer, this);
  }

  static AuthenticationLoading fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AuthenticationLoading.serializer, json);
  }

  static Serializer<AuthenticationLoading> get serializer =>
      _$authenticationLoadingSerializer;
}

abstract class AuthenticationUnauthenticated<T>
    implements
        Built<AuthenticationUnauthenticated<T>,
            AuthenticationUnauthenticatedBuilder<T>>,
        AuthenticationState<T> {
  AuthenticationUnauthenticated._();
  factory AuthenticationUnauthenticated(
          [void Function(AuthenticationUnauthenticatedBuilder<T>) updates]) =
      _$AuthenticationUnauthenticated<T>;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(
        AuthenticationUnauthenticated.serializer, this);
  }

  static AuthenticationUnauthenticated fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(
        AuthenticationUnauthenticated.serializer, json);
  }

  static Serializer<AuthenticationUnauthenticated> get serializer =>
      _$authenticationUnauthenticatedSerializer;
}

abstract class AuthenticationAuthenticated<T>
    implements
        Built<AuthenticationAuthenticated<T>,
            AuthenticationAuthenticatedBuilder<T>>,
        AuthenticationState<T> {
  T get user;

  AuthenticationAuthenticated._();
  factory AuthenticationAuthenticated(
          [void Function(AuthenticationAuthenticatedBuilder<T>) updates]) =
      _$AuthenticationAuthenticated<T>;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(
        AuthenticationAuthenticated.serializer, this);
  }

  static AuthenticationAuthenticated fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(
        AuthenticationAuthenticated.serializer, json);
  }

  static Serializer<AuthenticationAuthenticated> get serializer =>
      _$authenticationAuthenticatedSerializer;
}

abstract class AuthenticationFailure<T>
    implements
        Built<AuthenticationFailure<T>, AuthenticationFailureBuilder<T>>,
        AuthenticationState<T> {
  String get message;

  AuthenticationFailure._();
  factory AuthenticationFailure(
          [void Function(AuthenticationFailureBuilder<T>) updates]) =
      _$AuthenticationFailure<T>;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AuthenticationFailure.serializer, this);
  }

  static AuthenticationFailure fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AuthenticationFailure.serializer, json);
  }

  static Serializer<AuthenticationFailure> get serializer =>
      _$authenticationFailureSerializer;
}
