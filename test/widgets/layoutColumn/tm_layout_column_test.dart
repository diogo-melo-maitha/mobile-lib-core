import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/layoutColumn/tm_layout_column.dart';

void main() {
	const key = Key('key');

	group('TmLayoutColumn', () {
		testWidgets('TmDropdownButton is properly created', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          TmLayoutColumn(
						key: key,
						children: [
							Container()
						],
          ),
        ),
      );
      expect(find.byKey(key), findsOneWidget);
    });
	});
}