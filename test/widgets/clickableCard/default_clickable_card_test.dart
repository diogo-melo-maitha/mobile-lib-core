import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/clickableCard/default_clickable_card.dart';

void main() {
  const key = Key('key');
  const String primaryText = 'PrimaryText';
  group('DefaultClickableCard tests', () {
    testWidgets('DefaultClickableCard is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmDefaultClickableCard(
        key: key,
        primaryText: primaryText,
        onTap: () {},
        secondaryText: '',
      )));
      expect(find.byKey(key), findsOneWidget);
    });
    testWidgets('Given primaryText is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmDefaultClickableCard(
        key: key,
        primaryText: 'TRADEMASTER',
        onTap: () {},
        secondaryText: '',
      )));
      final primaryText = tester.widget<Text>(find.byType(Text).first);
      expect(primaryText.data, 'TRADEMASTER');
    });
    testWidgets('Given secondaryText is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmDefaultClickableCard(
        key: key,
        primaryText: 'TRADEMASTER',
        onTap: () {},
        secondaryText: 'Subtitle',
      )));
      final secondaryText = tester.widget<Text>(find.byType(Text).last);
      expect(secondaryText.data, 'Subtitle');
    });
    testWidgets('Given elevation is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmDefaultClickableCard(
        key: key,
        primaryText: primaryText,
        onTap: () {},
        elevation: 3,
        secondaryText: '',
      )));

      final container = tester.widget<Container>(find.byType(Container));

      expect(((container.decoration as BoxDecoration).boxShadow)!.single.blurRadius, 3);
    });
    testWidgets('Given function onTap is working', (tester) async {
        int functionCounter = 0;
        await tester.pumpWidget(TestUtils.buildTestableWidget(TmDefaultClickableCard(
          key: key,
          primaryText: primaryText,
          onTap: () {
            functionCounter++;
          },
          secondaryText: '',
        )));
        await tester.tap(find.byType(Container));
        await tester.pump();
        expect(functionCounter, 1);
        functionCounter = 0;
    });
  });
}