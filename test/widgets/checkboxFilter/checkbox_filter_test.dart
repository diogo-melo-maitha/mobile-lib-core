import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/checkboxFilter/checkbox_filter.dart';

void main() {
	const key = Key('key');

	int aux = 0;

	final onChange = (value) {
		 aux++;
	};

	group('TmCheckboxFilter', () {
		testWidgets('TmCheckboxFilter is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmCheckboxFilter(
        key: key,
        text: 'Test',
				value: false,
				onChange: onChange,
      )));
			
      expect(find.byKey(key), findsOneWidget);
    });

		testWidgets('TmCheckboxFilter on change value', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmCheckboxFilter(
        key: key,
        text: 'Test',
				value: false,
				onChange: onChange,
      )));

			await tester.tap(find.byKey(key));
      await tester.pump();
			
      expect(aux, 1);
			aux = 0;
    });
	});
}