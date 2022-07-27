import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/tm_lib_core.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/chart/tm_pie_chart.dart';

void main() {
  const key = Key('key');

  group('TmLimitInformationChart tests', () {
    testWidgets('TmLimitInformationChart is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmLimitInformationChart(
        key: key,
        availableLimit: 5000,
        processedPurchase: 3000,
        usedLimit: 4000,
        purchaseToProcess: 1000,
      )));
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Given availableLimit is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmLimitInformationChart(
        key: key,
        availableLimit: 5000,
        processedPurchase: 3000,
        usedLimit: 4000,
        purchaseToProcess: 1000,
      )));

      final text = tester.widget<Text>(find.byKey(TmLimitInformationChart.availableLimitTextKey));
      final value = text.data as String;
      expect(value.substring(3, value.length), '5.000,00');
    });

    testWidgets('TmPieChart is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmLimitInformationChart(
        key: key,
        availableLimit: 5000,
        processedPurchase: 3000,
        usedLimit: 4000,
        purchaseToProcess: 1000,
      )));

      expect(find.byType(TmPieChart), findsOneWidget);
    });

    testWidgets('Given usedLimit is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmLimitInformationChart(
        key: key,
        availableLimit: 5000,
        processedPurchase: 3000,
        usedLimit: 4000,
        purchaseToProcess: 1000,
      )));

      final text = tester.widget<Text>(find.byKey(TmLimitInformationChart.usedLimitTextKey));
      final value = text.data as String;
      expect(value.substring(3, value.length), '4.000,00');
    });
  });
}
