import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yesterday/blocs/blocs.dart';
import 'package:yesterday/services/services.dart';

class MockAuthenticationService<T> extends Mock
    implements AuthenticationService<T> {}

class MockAuthenticationBloc<T>
    extends MockBloc<AuthenticationBloc<T>, AuthenticationState<T>>
    implements AuthenticationBloc<T> {}

Widget shell<T>({
  AuthenticationBloc<T> Function(BuildContext) bloc,
  Widget child,
  NeumorphicThemeData theme,
  Map<String, WidgetBuilder> routes,
}) =>
    RepositoryProvider<AuthenticationService<T>>(
      create: (_) => MockAuthenticationService<T>(),
      child: BlocProvider<AuthenticationBloc<T>>(
        create: bloc ?? (_) => AuthenticationBloc(),
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
