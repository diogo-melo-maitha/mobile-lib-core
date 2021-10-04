import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/design/tm_scaffold.dart';

void main() {
	group('TmScaffold tests', () {
		const key = Key('key');
		
		testWidgets('TmDesignTopLines is properly created', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          TmScaffold(
            key: key,
						body: Container(),
          ),
        ),
      );
      expect(find.byKey(key), findsOneWidget);
    });
	});
}