import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:yesterday/blocs/blocs.dart';

class AuthenticationInterceptor<T> extends StatelessWidget {
  final Widget child;

  const AuthenticationInterceptor({Key key, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc<T>, AuthenticationState<T>>(
      listener: (context, state) {
        if (state is AuthenticationAuthenticated<T>) {
          Navigator.pushNamedAndRemoveUntil(context, 'main', (_) => false);
        } else if (state is AuthenticationUnauthenticated<T>) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        }
      },
      builder: (_, s) => s is AuthenticationAuthenticated<T>
          ? Provider<T>.value(value: s.user, child: child)
          : child,
    );
  }
}
