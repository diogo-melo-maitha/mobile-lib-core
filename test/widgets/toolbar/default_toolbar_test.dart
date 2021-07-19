import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/tm_lib_core.dart';
import 'package:flutter/material.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
  const key = Key('key');

  group('TmDefaultToolbar tests', () {
    testWidgets('TmDefaultToolbar is properly created', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultToolbar(
        key: key,
        onPressed: () {},
      )));
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Given title is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultToolbar(
        key: key,
        title: 'TRADEMASTER',
        onPressed: () {},
      )));

      final title = tester.widget<Text>(find.byType(Text));

      expect(title.data, 'TRADEMASTER');
    });

    testWidgets('Given textStyle is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultToolbar(
        key: key,
        textStyle: const TextStyle(color:Colors.red),
        onPressed: () {},
      )));

      final title = tester.widget<Text>(find.byType(Text));

      expect((title.style as TextStyle).color, Colors.red);
    });

    testWidgets('Given iconSize is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultToolbar(
        key: key,
        iconSize: 40,
        onPressed: () {},
      )));

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));

      expect(iconButton.iconSize, 40);
    });

    testWidgets('Given textStyle is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultToolbar(
        key: key,
        onPressed: () {},
        textStyle: const TextStyle(color: Colors.black),
      )));

      final title = tester.widget<Text>(find.byType(Text));

      expect((title.style as TextStyle).color, Colors.black);
    });

    testWidgets('Given function onPressed is working', (tester) async {
      int functionCounter = 0;
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultToolbar(
        key: key,
        onPressed: () {
          functionCounter++;
        },
      )));

      await tester.tap(find.byType(IconButton));
      await tester.pump();

      expect(functionCounter, 1);
      functionCounter = 0;
    });
  });
}
