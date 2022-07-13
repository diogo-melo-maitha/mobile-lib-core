import 'package:fake_async/fake_async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/tm_lib_core.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
  group('TmToast test', () {
    testWidgets('TmToast is properly created', (tester) async {
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
  });
}
