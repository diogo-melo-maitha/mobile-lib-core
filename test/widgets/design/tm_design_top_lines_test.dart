import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/design/tm_design_top_lines.dart';

void main() {
	const key = Key('key');

	group('TmDesignTopLines tests', () {
		testWidgets('TmDesignTopLines is properly created', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          const TmDesignTopLines(
            key: key,
						light: false,
						toolbar: true,
          ),
        ),
      );
      expect(find.byKey(key), findsOneWidget);
    });

		testWidgets('Given key empty is properly used', (tester) async {
      await tester.pumpWidget(
				TestUtils.buildTestableWidget(
					const TmDesignTopLines(
						light: false,
						toolbar: true
	     		)
				)
			);
    });

		testWidgets('Given light is properly used', (tester) async {
      await tester.pumpWidget(
				TestUtils.buildTestableWidget(
					const TmDesignTopLines(
						key: key,
						light: true,
						toolbar: true
	     		)
				)
			);
    });
	});
}