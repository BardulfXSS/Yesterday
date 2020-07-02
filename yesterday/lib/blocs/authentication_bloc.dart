import 'package:bloc/bloc.dart';
import 'package:built_value/built_value.dart';

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
    } else if (event is UserLoggedOut<T>) {
      yield* mapUserLoggedOutToState(event);
    }
  }

  Stream<AuthenticationState<T>> mapUserLoggedInToState(
      UserLoggedIn<T> event) async* {
    yield AuthenticationAuthenticated((b) => b..user = event.user);
  }

  Stream<AuthenticationState<T>> mapUserLoggedOutToState(
      UserLoggedOut<T> event) async* {
    yield AuthenticationUnauthenticated();
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
}

abstract class UserLoggedOut<T>
    implements
        Built<UserLoggedOut<T>, UserLoggedOutBuilder<T>>,
        AuthenticationEvent<T> {
  UserLoggedOut._();
  factory UserLoggedOut([void Function(UserLoggedOutBuilder<T>) updates]) =
      _$UserLoggedOut<T>;
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
}

abstract class AuthenticationLoading<T>
    implements
        Built<AuthenticationLoading<T>, AuthenticationLoadingBuilder<T>>,
        AuthenticationState<T> {
  AuthenticationLoading._();
  factory AuthenticationLoading(
          [void Function(AuthenticationLoadingBuilder<T>) updates]) =
      _$AuthenticationLoading<T>;
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
}
