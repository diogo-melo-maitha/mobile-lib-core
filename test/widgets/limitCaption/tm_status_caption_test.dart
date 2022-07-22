import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/tm_lib_core.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
  group('TmStatusCaption tests', () {
    testWidgets('TmStatusCaption is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmStatusCaption(
        color: TmColors.accent,
        status: 'Pago',
      )));

      expect(find.byType(TmStatusCaption), findsOneWidget);
    });
  });
}
