import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:yesterday/blocs/blocs.dart';

part 'serializers.g.dart';

@SerializersFor([
  LoginEvent,
  LoginInitial,
  LoginLoading,
  LoginSuccess,
  LoginFailure,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
