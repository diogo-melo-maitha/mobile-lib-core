import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/tm_lib_core.dart';
import 'package:flutter/material.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
  const key = Key('key');

  group('TmDefaultToolbar tests', () {
    testWidgets('TmDefaultToolbar is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmDefaultToolbar(
        key: key,
        onPressed: () {},
      )));
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Given iconSize is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmDefaultToolbar(
        key: key,
        iconSize: 40,
        onPressed: () {},
      )));

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));

      expect(iconButton.iconSize, 40);
    });

    testWidgets('Given function onPressed is working', (tester) async {
      int functionCounter = 0;
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmDefaultToolbar(
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