import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/unbounded_list_view.dart';

import 'test.dart';

void main() {
  testWidgets("builds widgets it needs", (t) async {
    final built = <int>[];
    await t.pumpWidget(shell<String>(child: UnboundedListView.builder(
      itemBuilder: (_, i) {
        built.add(i);
        return Text('$i');
      },
    )));

    expect(find.text('1'), findsOneWidget);
    expect(built, contains(1));
  });
  testWidgets("doesn't build widgets it doesn't need", (t) async {
    final built = <int>[];
    await t.pumpWidget(shell<String>(child: UnboundedListView.builder(
      itemBuilder: (_, i) {
        built.add(i);
        return Text('$i');
      },
    )));

    expect(find.text('100'), findsNothing);
    expect(built, isNot(contains(100)));
  });
  testWidgets("sizes to fit children's cross axis size", (t) async {
    await t.pumpWidget(shell<String>(
      child: Row(
        children: [
          UnboundedListView.builder(
            itemBuilder: (_, i) => SizedBox(width: 100, child: Text("$i")),
          ),
        ],
      ),
    ));

    expect(t.getSize(find.byType(UnboundedListView)).width, 100);
  });
}
