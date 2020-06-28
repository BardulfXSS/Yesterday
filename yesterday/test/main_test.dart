import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/main.dart';
import 'package:yesterday/services/services.dart';

import 'test.dart';

void main() {
  testWidgets('App-wide smoke test', (t) async {
    t.pumpWidget(RepositoryProvider<AuthenticationService<String>>(
      create: (_) => MockAuthenticationService(),
      child: YesterdayApp<String>(),
    ));
  });
}
