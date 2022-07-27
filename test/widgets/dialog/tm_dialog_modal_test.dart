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

    testWidgets('Given mainActionTitle is properly used', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          TmDialogModal(
            key: key,
            mainAction: () {},
            mainActionTitle: 'mainActionTitle',
            secondaryAction: () {},
            secondaryActionTitle: 'Test2',
            title: 'Title',
            subtitle: 'Subtitle',
            isDismissible: true,
          ),
        ),
      );

      final mainActionButton = tester.widget<TmDefaultButton>(find.byType(TmDefaultButton).first);

      expect(mainActionButton.title, 'mainActionTitle');
    });

    testWidgets('Given mainAction is properly used', (tester) async {
      int helper = 0;

      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          TmDialogModal(
            key: key,
            mainAction: () {
              helper++;
            },
            mainActionTitle: 'Test',
            secondaryAction: () {},
            secondaryActionTitle: 'Test2',
            title: 'Title',
            subtitle: 'Subtitle',
            isDismissible: true,
          ),
        ),
      );

      await tester.tap(find.byType(TmDefaultButton).first);
      await tester.pump();

      expect(helper, 1);
      helper--;
    });

    testWidgets('Given secondaryActionTitle is properly used', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          TmDialogModal(
            key: key,
            mainAction: () {},
            mainActionTitle: 'Test',
            secondaryAction: () {},
            secondaryActionTitle: 'secondaryActionTitle',
            title: 'Title',
            subtitle: 'Subtitle',
            isDismissible: true,
          ),
        ),
      );

      final secondaryActionButton = tester.widget<TmDefaultButton>(find.byType(TmDefaultButton).last);

      expect(secondaryActionButton.title, 'secondaryActionTitle');
    });

    testWidgets('Given secondaryAction is properly used', (tester) async {
      int counter = 0;

      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          TmDialogModal(
            key: key,
            mainAction: () {},
            mainActionTitle: 'Test',
            secondaryAction: () {
              counter++;
            },
            secondaryActionTitle: 'Test2',
            title: 'Title',
            subtitle: 'Subtitle',
            isDismissible: true,
          ),
        ),
      );

      await tester.tap(find.byType(TmDefaultButton).last);
      await tester.pump();

      expect(counter, 1);
      counter--;
    });

    testWidgets('Given title is properly used', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          TmDialogModal(
            key: key,
            mainAction: () {},
            mainActionTitle: 'Test',
            secondaryAction: () {},
            secondaryActionTitle: 'Test2',
            title: 'DifferentTitle',
            subtitle: 'Subtitle',
            isDismissible: true,
          ),
        ),
      );

      final title = tester.widget<Text>(find.byKey(TmDialogModal.titleKey));

      expect(title.data, 'DifferentTitle');
    });

    testWidgets('Given subtitle is properly used', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          TmDialogModal(
            key: key,
            mainAction: () {},
            mainActionTitle: 'Test',
            secondaryAction: () {},
            secondaryActionTitle: 'Test2',
            title: 'Title',
            subtitle: 'DifferentSubtitle',
            isDismissible: true,
          ),
        ),
      );

      final subtitle = tester.widget<Text>(find.byKey(TmDialogModal.subtitleKey));

      expect(subtitle.data, 'DifferentSubtitle');
    });
  });
}
