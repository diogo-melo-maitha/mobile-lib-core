import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/clickableCard/default_clickable_card.dart';

void main() {
  const key = Key('key');
  const String title = 'TITLE';
  group('DefaultClickableCard tests', () {
    testWidgets('DefaultClickableCard is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultClickableCard(
        key: key,
        title: title,
        onPressed: () {},
        subtitle: '',
      )));
      expect(find.byKey(key), findsOneWidget);
    });
    testWidgets('Given title is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultClickableCard(
        key: key,
        title: 'TRADEMASTER',
        onPressed: () {},
        subtitle: '',
      )));
      final title = tester.widget<Text>(find.byType(Text).first);
      expect(title.data, 'TRADEMASTER');
    });
    testWidgets('Given subtitle is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultClickableCard(
        key: key,
        title: 'TRADEMASTER',
        onPressed: () {},
        subtitle: 'Subtitle',
      )));
      final subtitle = tester.widget<Text>(find.byType(Text).last);
      expect(subtitle.data, 'Subtitle');
    });
    testWidgets('Given elevation is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultClickableCard(
        key: key,
        title: title,
        onPressed: () {},
        elevation: 3,
        subtitle: '',
      )));

      final container = tester.widget<Container>(find.byType(Container));

      expect(((container.decoration as BoxDecoration).boxShadow)!.single.blurRadius, 3);
    });
    testWidgets('Given function onPressed is working', (tester) async {
        int functionCounter = 0;
        await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultClickableCard(
          key: key,
          title: title,
          onPressed: () {
            functionCounter++;
          },
          subtitle: '',
        )));
        await tester.tap(find.byType(Container));
        await tester.pump();
        expect(functionCounter, 1);
        functionCounter = 0;
    });
  });
}