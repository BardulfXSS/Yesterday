import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yesterday/blocs/blocs.dart';

class Page<T> extends StatelessWidget {
  final Widget child;
  const Page({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc<T>, AuthenticationState<T>>(
      listener: (context, state) {
        if (state is AuthenticationStarted<T>) {
          Navigator.pushNamed(context, 'login');
        }
      },
      child: child,
    );
  }
}
