import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/text/text.dart';

import '../test.dart';

void main() {
  testWidgets('displays label text', (t) async {
    await t.pumpWidget(shell<String>(
      child: YesterdayTextField(labelText: 'foo'),
    ));
    expect(find.text('foo'), findsOneWidget);
  });
  testWidgets('uses controller', (t) async {
    final controller = TextEditingController();
    await t.pumpWidget(shell<String>(
      child: YesterdayTextField(controller: controller),
    ));
    await t.enterText(find.byType(YesterdayTextField), 'foo bar baz');
    expect(controller.text, 'foo bar baz');
  });
}
