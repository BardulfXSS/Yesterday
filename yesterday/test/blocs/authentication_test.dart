import 'package:bloc_test/bloc_test.dart';
import 'package:yesterday/blocs/blocs.dart';

void main() {
  blocTest(
    'has initial state AuthenticationInitial',
    build: () async => AuthenticationBloc<String>(),
    skip: 0,
    expect: [AuthenticationInitial<String>()],
  );
  blocTest(
    'emits AuthenticationStarted when LoginButtonPressed',
    build: () async => AuthenticationBloc<String>(),
    act: (b) async => b.add(LoginButtonPressed()),
    expect: [AuthenticationStarted<String>()],
  );
}
