import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/chart/tm_pie_chart.dart';

void main() {
  const key = Key('key');

  group('TmPieChart tests', () {
    testWidgets('TmPieChart is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmPieChart(
        key: key,
        availableLimit: 5000,
        processedPurchase: 3000,
        usedLimit: 4000,
        purchaseToProcess: 1000,
      )));
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Given availableLimit is properly used', (tester) async {
      const double availableLimit = 5000;
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmPieChart(
        key: key,
        availableLimit: availableLimit,
        processedPurchase: 3000,
        usedLimit: 4000,
        purchaseToProcess: 1000,
      )));

      final toProcessChart = tester.widget<AnimatedCircularChart>(find.byKey(TmPieChart.toProcessChartKey));
      final limitChart = toProcessChart.initialChartData?.last;
      final availableLimitFirstChart = limitChart?.entries.last;
      expect(availableLimitFirstChart?.value, availableLimit + 3000);

      final processedChart = tester.widget<AnimatedCircularChart>(find.byKey(TmPieChart.processedChartKey));
      final chartData = processedChart.initialChartData?.last;
      final availableLimitSecondChart = chartData?.entries.last;
      expect(availableLimitSecondChart?.value, availableLimit + 1000);
    });

    testWidgets('Given processedPurchase is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmPieChart(
        key: key,
        availableLimit: 5000,
        processedPurchase: 3000,
        usedLimit: 4000,
        purchaseToProcess: 1000,
      )));

      final chart = tester.widget<AnimatedCircularChart>(find.byKey(TmPieChart.processedChartKey));
      final limitChart = chart.initialChartData?.first;
      final availableLimitChart = limitChart?.entries.first;
      expect(availableLimitChart!.value, 3000);
    });

    testWidgets('Given purchaseToProcess is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmPieChart(
        key: key,
        availableLimit: 5000,
        processedPurchase: 3000,
        usedLimit: 4000,
        purchaseToProcess: 1000,
      )));

      final chart = tester.widget<AnimatedCircularChart>(find.byKey(TmPieChart.toProcessChartKey));
      final limitChart = chart.initialChartData?.first;
      final availableLimitChart = limitChart?.entries.first;
      expect(availableLimitChart?.value, 1000);
    });
  });
}
