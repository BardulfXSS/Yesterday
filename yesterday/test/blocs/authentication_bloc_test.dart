import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/blocs/blocs.dart';

void main() => group('AuthenticationBloc', () {
      blocTest(
        'emits AuthenticationIntial',
        build: () async => AuthenticationBloc<String>(),
        skip: 0,
        expect: [AuthenticationInitial<String>()],
      );
      group('on user logged in', () {
        blocTest(
          'emits AuthenticationAuthenticated',
          build: () async => AuthenticationBloc<String>(),
          act: (b) async => b.add(UserLoggedIn<String>((b) => b.user = 'foo')),
          expect: [AuthenticationAuthenticated<String>((b) => b.user = 'foo')],
        );
      });
      group('on user logged out', () {
        blocTest(
          'emits AuthenticationUnauthenticated',
          build: () async => AuthenticationBloc<String>(),
          act: (b) => b.add(UserLoggedOut<String>()),
          expect: [AuthenticationUnauthenticated<String>()],
        );
      });
    });
