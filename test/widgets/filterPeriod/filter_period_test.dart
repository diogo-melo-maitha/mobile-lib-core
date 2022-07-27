import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/filterPeriod/filter_period.dart';

void main() {
	const key = Key('key');

	int aux = 0;
	final TextEditingController dayController = TextEditingController();
	final TextEditingController monthController = TextEditingController();
	final TextEditingController yearController = TextEditingController();
	final onChange = (date) => aux++;
	final DateTime startDate = DateTime(2022);
	final DateTime? maxDate = DateTime(2023);

	group('TmFilterPeriod', () {
		testWidgets('TmFilterPeriod is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmFilterPeriod(
        key: key,
        dayController: dayController,
				monthController: monthController,
				yearController: yearController,
				onChange: onChange,
				startDate: startDate,
				maxDate: maxDate,
      )));
      expect(find.byKey(key).first, findsOneWidget);
    });

		testWidgets('TmFilterPeriod on press show date picker', (tester) async {
			tester.binding.window.physicalSizeTestValue = const Size(2000, 3000);
			
			await tester.pumpWidget(TestUtils.buildTestableWidget(TmFilterPeriod(
				key: key,
        dayController: dayController,
				monthController: monthController,
				yearController: yearController,
				onChange: onChange,
				startDate: startDate,
				maxDate: maxDate,
			)));

			await tester.tap(find.byKey(key).first);
      await tester.pump();

			expect(find.byType(CupertinoDatePicker), findsOneWidget);
		});
	});
}