import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/limitVisualizationCard/tm_limit_visualization_card.dart';

void main() {
	const key = Key('key');

	group('TmLimitVisualizationCard tests', () {
		testWidgets('TmLimitVisualizationCard is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmLimitVisualizationCard(
        key: key,
        onTap: () {},
				elevation: 1,
				arrangementIcon: const Icon(Icons.ac_unit),
				availableLimit: 1000,
				takenLimit: 100,
      )));

      expect(find.byKey(key), findsOneWidget);
    });

		testWidgets('TmLimitVisualizationCard on tap', (tester) async {
			int count = 0;

			void onTap() {
				count++;
			}

      await tester.pumpWidget(TestUtils.buildTestableWidget(TmLimitVisualizationCard(
        key: key,
        onTap: onTap,
				elevation: 1,
				arrangementIcon: const Icon(Icons.ac_unit),
				availableLimit: 1000,
				takenLimit: 100,
      )));

			await tester.ensureVisible(find.byType(InkWell));
      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(count, 1);
			count = 0;
    });
	});
}