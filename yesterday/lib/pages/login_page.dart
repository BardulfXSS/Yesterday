import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:yesterday/blocs/blocs.dart';
import 'package:yesterday/services/services.dart';
import 'package:yesterday/text/text.dart';

class LoginPage<T> extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailNode = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordNode = FocusNode();

  final void Function(BuildContext, LoginEvent) onSubmitted;

  LoginPage({Key key, this.onSubmitted}) : super(key: key);

  LoginWithEmailPassword loginWithEmailPassword([String password]) =>
      LoginWithEmailPassword((b) => b
        ..email = emailController.text
        ..password = password ?? passwordController.text);

  void submitLoginForm(BuildContext context, LoginEvent event) {
    passwordNode.unfocus();
    context.bloc<LoginBloc<T>>().add(event);
  }

  void Function([String]) submit(BuildContext context) => ([String password]) {
        final submitFn = onSubmitted ?? submitLoginForm;
        submitFn(context, loginWithEmailPassword(password));
      };

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocProvider(
      create: (c) => LoginBloc<T>(
          context.repository<AuthenticationService<T>>(),
          context.bloc<AuthenticationBloc<T>>()),
      child: BlocBuilder<LoginBloc<T>, LoginState<T>>(
        builder: (c, s) => Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              YesterdayTextField(
                controller: emailController,
                enabled: s is LoginInitial<T>,
                focusNode: emailNode,
                labelText: 'Email',
                textInputAction: TextInputAction.next,
                onSubmitted: (v) => passwordNode.requestFocus(),
              ),
              YesterdayTextField(
                controller: passwordController,
                enabled: s is LoginInitial<T>,
                focusNode: passwordNode,
                labelText: 'Password',
                obscureText: true,
                onSubmitted: submit(c),
              ),
            ],
          ),
          floatingActionButton: NeumorphicButton(
            onPressed: submit(c),
            padding: const EdgeInsets.all(24),
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.circle(),
              depth: NeumorphicTheme.of(context).current.depth,
            ),
            child: Icon(Icons.done),
          ),
        ),
      ),
    );
  }
}
