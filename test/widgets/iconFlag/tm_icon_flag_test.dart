import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/iconFlag/tm_icon_flag.dart';

void main() {
	group('TmIconFlag tests', () {
		const key = Key('key');

		testWidgets('TmIconFlag is properly created', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          const TmIconFlag(
						Icon(Icons.ac_unit),
            key: key
          )
        )
      );
      expect(find.byKey(key), findsOneWidget);
    });

		testWidgets('Given icon is properly used and showFlag false show Container', (tester) async {
      await tester.pumpWidget(
				TestUtils.buildTestableWidget(
					const TmIconFlag(
						Icon(Icons.ac_unit),
						key: key
      		)
				)
			);

      final stack = tester.widget<Stack>(find.byType(Stack).first);
			final icon = stack.children[0] as Icon;
			final container = stack.children[1];
			expect(icon.icon, Icons.ac_unit);
      expect(container.runtimeType, Container);
    });

		testWidgets('Given showFlag true show Positioned', (tester) async {
      await tester.pumpWidget(
				TestUtils.buildTestableWidget(
					const TmIconFlag(
						Icon(Icons.ac_unit),
						key: key,
						showFlag: true,
      		)
				)
			);

      final stack = tester.widget<Stack>(find.byType(Stack).first);
			final positioned = stack.children[1] as Positioned;
      expect(positioned.top, 0);
			expect(positioned.left, 17);
    });
	});
}