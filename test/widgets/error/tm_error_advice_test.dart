import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/tm_lib_core.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
  const key = Key('key');
  group('TmErrorAdvice tests', () {
    testWidgets('TmErrorAdvice is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmErrorAdvice(
          key: key, icon: Icons.description, description: 'description', buttontitle: 'buttontitle', action: () {})));
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Given icon is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmErrorAdvice(
          key: key, icon: Icons.add, description: 'description', buttontitle: 'buttontitle', action: () {})));
      final icon = tester.widget<Icon>(find.byType(Icon));
      expect(icon.icon, Icons.add);
    });

    testWidgets('Given description is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmErrorAdvice(
          key: key,
          icon: Icons.description,
          description: 'AnotherDescription',
          buttontitle: 'buttontitle',
          action: () {})));
      final description = tester.widget<Text>(find.byKey(TmErrorAdvice.descriptionKey));
      expect(description.data, 'AnotherDescription');
    });

    testWidgets('Given buttontitle is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmErrorAdvice(
          key: key,
          icon: Icons.description,
          description: 'description',
          buttontitle: 'AnotherButtonTitle',
          action: () {})));
      final button = tester.widget<TmDefaultButton>(find.byType(TmDefaultButton));
      final buttontitle = button.title;
      expect(buttontitle, 'AnotherButtonTitle');
    });

    testWidgets('Given action is properly used', (tester) async {
      int counter = 0;
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmErrorAdvice(
          key: key,
          icon: Icons.description,
          description: 'description',
          buttontitle: 'buttontitle',
          action: () {
            counter++;
          })));
      await tester.tap(find.byType(TmDefaultButton));
      expect(counter, 1);
      counter--;
    });
  });
}
