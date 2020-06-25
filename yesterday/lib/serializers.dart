import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:yesterday/blocs/authentication.dart';

part 'serializers.g.dart';

@SerializersFor([
  LoginButtonPressed,
  AuthenticationInitial,
  AuthenticationStarted,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
