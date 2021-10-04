import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/design/tm_design_bottom_lines_logo_secondary.dart';

void main() {
	const key = Key('key');

	group('TmDesignBottomLinesLogoSecondary tests', () {
		testWidgets('TmDesignBottomLinesLogoSecondary is properly created', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          const TmDesignBottomLinesLogoSecondary(
            key: key
          ),
        ),
      );
      expect(find.byKey(key), findsOneWidget);
    });
	});
}