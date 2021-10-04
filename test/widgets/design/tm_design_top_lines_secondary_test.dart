import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/design/tm_design_top_lines_secondary.dart';

void main() {
	const key = Key('key');

	group('TmDesignTopLinesSecondary tests', () {
		testWidgets('TmDesignTopLinesSecondary is properly created', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          const TmDesignTopLinesSecondary(
            key: key
          ),
        ),
      );
      expect(find.byKey(key), findsOneWidget);
    });
	});
}