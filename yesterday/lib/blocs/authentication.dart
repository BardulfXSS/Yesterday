import 'package:bloc/bloc.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:yesterday/serializers.dart';

part 'authentication.g.dart';

abstract class AuthenticationEvent {}

abstract class LoginButtonPressed
    implements
        Built<LoginButtonPressed, LoginButtonPressedBuilder>,
        AuthenticationEvent {
  LoginButtonPressed._();
  factory LoginButtonPressed(
          [void Function(LoginButtonPressedBuilder) updates]) =
      _$LoginButtonPressed;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LoginButtonPressed.serializer, this);
  }

  static LoginButtonPressed fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(LoginButtonPressed.serializer, json);
  }

  static Serializer<LoginButtonPressed> get serializer =>
      _$loginButtonPressedSerializer;
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

abstract class AuthenticationStarted<T>
    implements
        Built<AuthenticationStarted<T>, AuthenticationStartedBuilder<T>>,
        AuthenticationState<T> {
  AuthenticationStarted._();
  factory AuthenticationStarted(
          [void Function(AuthenticationStartedBuilder<T>) updates]) =
      _$AuthenticationStarted<T>;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AuthenticationStarted.serializer, this);
  }

  static AuthenticationStarted fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AuthenticationStarted.serializer, json);
  }

  static Serializer<AuthenticationStarted> get serializer =>
      _$authenticationStartedSerializer;
}

class AuthenticationBloc<T>
    extends Bloc<AuthenticationEvent, AuthenticationState<T>> {
  @override
  AuthenticationState<T> get initialState => AuthenticationInitial<T>();

  @override
  Stream<AuthenticationState<T>> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield* mapLoginButtonPressedToState(event);
    }
  }

  Stream<AuthenticationState<T>> mapLoginButtonPressedToState(
      LoginButtonPressed event) async* {
    print('login button pressed');
    yield AuthenticationStarted();
  }
}
