import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dartz/dartz.dart';
import 'package:yesterday/serializers.dart';

part 'authentication_service.g.dart';

abstract class AuthenticationService<T> {
  Future<Either<AuthenticationError, T>> loginWithEmailPassword(
      String email, String password);
}

abstract class AuthenticationError
    implements Built<AuthenticationError, AuthenticationErrorBuilder> {
  String get message;

  AuthenticationError._();
  factory AuthenticationError(
          [void Function(AuthenticationErrorBuilder) updates]) =
      _$AuthenticationError;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AuthenticationError.serializer, this);
  }

  static AuthenticationError fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AuthenticationError.serializer, json);
  }

  static Serializer<AuthenticationError> get serializer =>
      _$authenticationErrorSerializer;
}

/// This class is untested as it is only here to stub out a real implementation
/// later on
class PlaceholderAuthenticationService<T> implements AuthenticationService<T> {
  Future<T> Function(String, String) getUser;

  PlaceholderAuthenticationService(this.getUser);

  @override
  Future<Either<AuthenticationError, T>> loginWithEmailPassword(
      String email, String password) async {
    return Right(await getUser(email, password));
  }
}
