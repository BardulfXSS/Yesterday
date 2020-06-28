import 'package:bloc/bloc.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:yesterday/blocs/blocs.dart';
import 'package:yesterday/serializers.dart';
import 'package:yesterday/services/authentication_service.dart';

part 'login_bloc.g.dart';

class LoginBloc<T> extends Bloc<LoginEvent, LoginState<T>> {
  final AuthenticationService<T> authenticationService;
  final AuthenticationBloc<T> authenticationBloc;

  LoginBloc(this.authenticationService, [this.authenticationBloc])
      : assert(authenticationService != null),
        super();

  @override
  LoginState<T> get initialState => LoginInitial<T>();

  @override
  Stream<LoginState<T>> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithEmailPassword) {
      yield* mapLoginWithEmailPassword(event);
    }
  }

  Stream<LoginState<T>> mapLoginWithEmailPassword(
      LoginWithEmailPassword event) async* {
    yield LoginLoading<T>();
    try {
      final result = await authenticationService.loginWithEmailPassword(
          event.email, event.password);

      result.forEach((r) {
        authenticationBloc?.add(UserLoggedIn<T>((b) => b..user = r));
      });

      yield result
          .map((r) => LoginSuccess<T>((b) => b..user = r))
          .leftMap((l) => LoginFailure<T>((b) => b..error = l.message))
          .fold((l) => l, (r) => r);
    } catch (e) {
      yield LoginFailure<T>(
        (b) => b..error = e?.message ?? 'Unknown error occurred',
      );
    }

    yield LoginInitial<T>();
  }
}

abstract class LoginEvent {}

abstract class LoginWithEmailPassword
    implements
        Built<LoginWithEmailPassword, LoginWithEmailPasswordBuilder>,
        LoginEvent {
  String get email;
  String get password;

  LoginWithEmailPassword._();
  factory LoginWithEmailPassword(
          [void Function(LoginWithEmailPasswordBuilder) updates]) =
      _$LoginWithEmailPassword;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LoginWithEmailPassword.serializer, this);
  }

  static LoginWithEmailPassword fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(LoginWithEmailPassword.serializer, json);
  }

  static Serializer<LoginWithEmailPassword> get serializer =>
      _$loginWithEmailPasswordSerializer;
}

abstract class LoginState<T> {}

abstract class LoginInitial<T>
    implements Built<LoginInitial<T>, LoginInitialBuilder<T>>, LoginState<T> {
  LoginInitial._();
  factory LoginInitial([void Function(LoginInitialBuilder<T>) updates]) =
      _$LoginInitial<T>;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LoginInitial.serializer, this);
  }

  static LoginInitial fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(LoginInitial.serializer, json);
  }

  static Serializer<LoginInitial> get serializer => _$loginInitialSerializer;
}

abstract class LoginLoading<T>
    implements Built<LoginLoading<T>, LoginLoadingBuilder<T>>, LoginState<T> {
  LoginLoading._();
  factory LoginLoading([void Function(LoginLoadingBuilder<T>) updates]) =
      _$LoginLoading<T>;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LoginLoading.serializer, this);
  }

  static LoginLoading fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(LoginLoading.serializer, json);
  }

  static Serializer<LoginLoading> get serializer => _$loginLoadingSerializer;
}

abstract class LoginSuccess<T>
    implements Built<LoginSuccess<T>, LoginSuccessBuilder<T>>, LoginState<T> {
  T get user;

  LoginSuccess._();
  factory LoginSuccess([void Function(LoginSuccessBuilder<T>) updates]) =
      _$LoginSuccess<T>;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LoginSuccess.serializer, this);
  }

  static LoginSuccess fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(LoginSuccess.serializer, json);
  }

  static Serializer<LoginSuccess> get serializer => _$loginSuccessSerializer;
}

abstract class LoginFailure<T>
    implements Built<LoginFailure<T>, LoginFailureBuilder<T>>, LoginState<T> {
  String get error;

  LoginFailure._();
  factory LoginFailure([void Function(LoginFailureBuilder<T>) updates]) =
      _$LoginFailure<T>;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LoginFailure.serializer, this);
  }

  static LoginFailure fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(LoginFailure.serializer, json);
  }

  static Serializer<LoginFailure> get serializer => _$loginFailureSerializer;
}
