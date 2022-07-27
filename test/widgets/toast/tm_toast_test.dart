import 'package:fake_async/fake_async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/tm_lib_core.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
  group('TmToast test', () {
    testWidgets('TmToast is properly created with error', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          Builder(builder: (context) {
            return TmDefaultButton(
              key: const Key('key'),
              title: 'Open TmToast',
              backgroundColor: Colors.blue,
              onPressed: () async {
                await FakeAsync().run((async) async {
                  TmToast.showError(title: 'Error TmToast', context: context);
                });
              },
              elevation: 1,
            );
          }),
        ),
      );

      await tester.tap(find.byType(TmDefaultButton).first);
      await tester.pump();

      final text = tester.widget<Text>(find.text('Error TmToast'));
      expect(text.data, 'Error TmToast');
    });

    testWidgets('TmToast is properly created with success', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          Builder(builder: (context) {
            return TmDefaultButton(
              key: const Key('key'),
              title: 'Open TmToast',
              backgroundColor: Colors.blue,
              onPressed: () async {
                await FakeAsync().run((async) async {
                  TmToast.showSuccess(title: 'Success TmToast', context: context);
                });
              },
              elevation: 1,
            );
          }),
        ),
      );

      await tester.tap(find.byType(TmDefaultButton).first);
      await tester.pump();

      final text = tester.widget<Text>(find.text('Success TmToast'));
      expect(text.data, 'Success TmToast');
    });

    testWidgets('TmToast is properly created with natural', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          Builder(builder: (context) {
            return TmDefaultButton(
              key: const Key('key'),
              title: 'Open TmToast',
              backgroundColor: Colors.blue,
              onPressed: () async {
                await FakeAsync().run((async) async {
                  TmToast.showNeutral(title: 'Natural TmToast', context: context);
                });
              },
              elevation: 1,
            );
          }),
        ),
      );

      await tester.tap(find.byType(TmDefaultButton).first);
      await tester.pump();

      final text = tester.widget<Text>(find.text('Natural TmToast'));
      expect(text.data, 'Natural TmToast');
    });

    testWidgets('TmToast is properly created with warning', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          Builder(builder: (context) {
            return TmDefaultButton(
              key: const Key('key'),
              title: 'Open TmToast',
              backgroundColor: Colors.blue,
              onPressed: () async {
                await FakeAsync().run((async) async {
                  TmToast.showWarning(title: 'Warning TmToast', context: context);
                });
              },
              elevation: 1,
            );
          }),
        ),
      );

      await tester.tap(find.byType(TmDefaultButton).first);
      await tester.pump();

      final text = tester.widget<Text>(find.text('Warning TmToast'));
      expect(text.data, 'Warning TmToast');
    });
  });
}
