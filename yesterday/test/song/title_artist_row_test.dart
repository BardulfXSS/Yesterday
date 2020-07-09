import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yesterday/models/models.dart';
import 'package:yesterday/song/song.dart';
import 'package:yesterday/text/text.dart';

import '../test.dart';

void main() {
  testWidgets("displays title in label text", (t) async {
    await t.pumpWidget(shell<String>(
      child: TitleArtistRow(
          song: Song((b) => b
            ..title = 'foo'
            ..duration = Duration())),
    ));

    expect(
      find.descendant(of: find.byType(LabelText), matching: find.text('foo')),
      findsOneWidget,
    );
  });
  testWidgets("does not display artist (or center dot) if not present",
      (t) async {
    await t.pumpWidget(shell<String>(
      child: TitleArtistRow(
          song: Song((b) => b
            ..title = 'foo'
            ..duration = Duration())),
    ));

    expect(
      find.byWidgetPredicate((w) => w is Text && w.data.contains('•')),
      findsNothing,
    );
  });
  testWidgets("displays artist in body text if present", (t) async {
    await t.pumpWidget(shell<String>(
      child: TitleArtistRow(
          song: Song((b) => b
            ..title = 'foo'
            ..artist.name = 'bar'
            ..duration = Duration())),
    ));

    expect(
      find.byWidgetPredicate((w) => w is Text && w.data.contains('•')),
      findsOneWidget,
    );
    expect(
      find.descendant(of: find.byType(BodyText), matching: find.text(' • bar')),
      findsOneWidget,
    );
  });
}
