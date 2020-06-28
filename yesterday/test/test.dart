import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yesterday/blocs/blocs.dart';
import 'package:yesterday/services/services.dart';

class MockAuthenticationService<T> extends Mock
    implements AuthenticationService<T> {}

Widget shell<T>({
  NeumorphicThemeData theme,
  Map<String, WidgetBuilder> routes,
  Widget child,
}) =>
    RepositoryProvider<AuthenticationService<T>>(
      create: (_) => MockAuthenticationService<T>(),
      child: BlocProvider<AuthenticationBloc<T>>(
        create: (_) => AuthenticationBloc(),
        child: NeumorphicApp(
          theme: theme ?? NeumorphicThemeData(),
          routes: routes ?? {},
          home: child != null
              ? Scaffold(
                  body: child,
                )
              : null,
        ),
      ),
    );

Finder findByType<T>(T unit) => find.byWidgetPredicate((w) => w is T);
