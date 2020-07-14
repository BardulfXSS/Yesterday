import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yesterday/blocs/blocs.dart';
import 'package:yesterday/services/services.dart';

import '../test.dart';

void main() => group('LoginBloc', () {
      blocTest(
        'emits LoginInitial',
        build: () async => LoginBloc(MockAuthenticationService<String>()),
        skip: 0,
        expect: [LoginInitial<String>()],
      );
      group('on login with email and password', () {
        blocTest(
          'emits LoginLoading',
          build: () async => LoginBloc(MockAuthenticationService<String>()),
          act: (b) => b.add(LoginWithEmailPassword((b) => b
            ..email = 'foo'
            ..password = 'bar')),
          expect: [LoginLoading<String>()],
        );
        blocTest(
          'attempts to log in user',
          build: () async => LoginBloc(MockAuthenticationService<String>()),
          act: (b) async => b.add(LoginWithEmailPassword((b) => b
            ..email = 'foo'
            ..password = 'bar')),
          verify: (b) async => verify(
                  b.authenticationService.loginWithEmailPassword('foo', 'bar'))
              .called(1),
        );
        group('when login fails', () {
          blocTest(
            'emits LoginFailure',
            build: () async => LoginBloc(MockAuthenticationService<String>()),
            act: (b) async {
              when(b.authenticationService.loginWithEmailPassword(any, any))
                  .thenAnswer((_) async => Left<AuthenticationError, String>(
                        AuthenticationError((b) => b.message = 'foo'),
                      ));
              b.add(LoginWithEmailPassword((b) => b
                ..email = 'bar'
                ..password = 'baz'));
            },
            skip: 2,
            expect: [
              LoginFailure<String>((b) => b.error = 'foo'),
              LoginInitial<String>(),
            ],
          );
        });
        group('when login throws', () {
          blocTest(
            'emits LoginFailure',
            build: () async => LoginBloc(MockAuthenticationService<String>()),
            act: (b) async {
              when(b.authenticationService.loginWithEmailPassword(any, any))
                  .thenThrow(Exception('foo'));
              b.add(LoginWithEmailPassword((b) => b
                ..email = 'bar'
                ..password = 'baz'));
            },
            skip: 2,
            expect: [
              LoginFailure<String>((b) => b.error = 'foo'),
              LoginInitial<String>(),
            ],
          );
        });
        group('when login succeeds', () {
          blocTest(
            'emits LoginSuccess followed by LoginInitial',
            build: () async => LoginBloc(MockAuthenticationService<String>()),
            act: (b) async {
              when(b.authenticationService.loginWithEmailPassword(any, any))
                  .thenAnswer(
                      (_) async => Right<AuthenticationError, String>('foo'));
              b.add(LoginWithEmailPassword((b) => b
                ..email = 'bar'
                ..password = 'baz'));
            },
            skip: 2,
            expect: [
              LoginSuccess<String>((b) => b.user = 'foo'),
              LoginInitial<String>(),
            ],
          );
          blocTest(
            'notifies AuthenticationBloc',
            build: () async => LoginBloc<String>(
                MockAuthenticationService(), MockAuthenticationBloc()),
            act: (b) async {
              when(b.authenticationService.loginWithEmailPassword(any, any))
                  .thenAnswer(
                      (_) async => Right<AuthenticationError, String>('foo'));
              b.add(LoginWithEmailPassword((b) => b
                ..email = 'bar'
                ..password = 'baz'));
            },
            verify: (b) async => verify(b.authenticationBloc
                .add(UserLoggedIn<String>((b) => b.user = 'foo'))).called(1),
          );
        });
      });
    });
