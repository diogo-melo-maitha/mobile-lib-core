import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/dotIndicator/tm_dot_indicator.dart';

void main() {
	group('TmDotIndicator Tests', () {
		const key = Key('key');

		testWidgets('TmDotIndicator is properly created', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          const TmDotIndicator(
            key: key,
						activeIndex: 0,
						dotLength: 1,
          ),
        ),
      );
      expect(find.byType(TmDotIndicator), findsOneWidget);
    });
	});
}