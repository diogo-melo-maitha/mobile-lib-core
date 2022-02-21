import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/tm_lib_core.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

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

      final chart = tester.widget<AnimatedCircularChart>(find.byKey(TmLimitInformationChart.chartKey2));
      final limitChart = chart.initialChartData?.last;
      final availableLimitChart = limitChart?.entries.last;
      expect(availableLimitChart?.value, 5000);
    });

    testWidgets('Given processedPurchase is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmLimitInformationChart(
        key: key,
        availableLimit: 5000,
        processedPurchase: 3000,
        usedLimit: 4000,
        purchaseToProcess: 1000,
      )));

      final chart = tester.widget<AnimatedCircularChart>(find.byKey(TmLimitInformationChart.chartKey2));
      final limitChart = chart.initialChartData?.last;
      final availableLimitChart = limitChart?.entries;
      expect(availableLimitChart![1].value, 3000);
    });

    testWidgets('Given purchaseToProcess is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmLimitInformationChart(
        key: key,
        availableLimit: 5000,
        processedPurchase: 3000,
        usedLimit: 4000,
        purchaseToProcess: 1000,
      )));

      final chart = tester.widget<AnimatedCircularChart>(find.byKey(TmLimitInformationChart.chartKey2));
      final limitChart = chart.initialChartData?.last;
      final availableLimitChart = limitChart?.entries.first;
      expect(availableLimitChart?.value, 1000);
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
