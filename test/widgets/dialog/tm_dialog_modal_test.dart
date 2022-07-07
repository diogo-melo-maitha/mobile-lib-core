import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/tm_lib_core.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/dialog/tm_dialog_modal.dart';

void main() {
  group('TmDialogModal tests', () {
    const key = Key('key');

    testWidgets('TmDialogModal is properly created', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          TmDialogModal(
            key: key,
            mainAction: () {},
            mainActionTitle: 'Test',
            title: 'Title',
            subtitle: 'Subtitle',
            isDismissible: true,
          ),
        ),
      );
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('TmDialogModal has one button', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          TmDialogModal(
            key: key,
            mainAction: () {},
            mainActionTitle: 'Test',
            title: 'Title',
            subtitle: 'Subtitle',
            isDismissible: true,
          ),
        ),
      );

      expect(find.byType(TmDefaultButton), findsOneWidget);
    });

    testWidgets('TmDialogModal has two button', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          TmDialogModal(
            key: key,
            mainAction: () {},
            mainActionTitle: 'Test',
            secondaryAction: () {},
            secondaryActionTitle: 'Test2',
            title: 'Title',
            subtitle: 'Subtitle',
            isDismissible: true,
          ),
        ),
      );

      expect(find.byType(TmDefaultButton), findsNWidgets(2));
    });
  });
}
