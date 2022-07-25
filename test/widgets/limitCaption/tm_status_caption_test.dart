import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/tm_lib_core.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
  const key = Key('key');
  group('TmStatusCaption tests', () {
    testWidgets('TmStatusCaption is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmStatusCaption(
        key: key,
        color: TmColors.accent,
        status: 'Pago',
      )));

      expect(find.byType(TmStatusCaption), findsOneWidget);
    });

    testWidgets('TmStatusCaption checking the text', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmStatusCaption(
        key: key,
        color: TmColors.accent,
        status: 'Pago',
      )));

      final text = tester.widget<Text>(find.text('Pago'));

      expect(text.data, 'Pago');
    });

    testWidgets('TmStatusCaption checking the container color', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmStatusCaption(
        key: key,
        color: TmColors.accent,
        status: 'Pago',
      )));

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.color, TmColors.accent);
    });
  });
}
