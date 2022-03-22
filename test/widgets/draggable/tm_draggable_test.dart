import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/draggable/tm_draggable.dart';

void main() {
	group('TmDraggable tests', () {
		const key = Key('key');

		var aux = 0;

		void testFunc() {
			aux++;
		}

		testWidgets('TmDraggable is properly created', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          TmDraggable(
            key: key,
						children: [
							Container()
						],
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
    });

		testWidgets('TmDraggable set properties', (tester) async {
			tester.binding.window.physicalSizeTestValue = const Size(1000, 2000);
			
			await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          TmDraggable(
            key: key,
						title: 'Test',
						mainAxisAlignment: MainAxisAlignment.center,
						maxHeight: 100,
						minHeight: 100,
						showCloseButton: false,
						children: [
							Container()
						],
          ),
        ),
      );

      expect(find.byKey(key), findsOneWidget);
    });

		testWidgets('TmDraggable on close test', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          TmDraggable(
            key: key,
						onClose: testFunc,
						children: [
							Container()
						],
          ),
        ),
      );

			await tester.tap(find.byKey(TmDraggable.gestureDetectorKey));
      await tester.pumpAndSettle();
			
      expect(aux, 1);

			aux = 0;
    });
	});
}