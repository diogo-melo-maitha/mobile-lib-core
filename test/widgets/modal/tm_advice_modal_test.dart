import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/modal/tm_advice_modal.dart';

void main() {
  const key = Key('key');

  group(
    'DefaultButton tests',
    () {
      testWidgets('TmAdviceModal is properly used', (tester) async {
        await tester.pumpWidget(TestUtils.buildTestableWidget(TmAdviceModal(
          key: key,
          title: '',
          clickableText: '',
          onTap: () {},
        )));
        expect(find.byKey(key), findsOneWidget);
      });

      testWidgets('Given title is properly used', (tester) async {
        await tester.pumpWidget(TestUtils.buildTestableWidget(TmAdviceModal(
          key: key,
          title: 'Abc',
          clickableText: '',
          onTap: () {},
        )));
        final title = tester.widget<Text>(find.byKey(TmAdviceModal.titleKey));
        expect(title.data, 'Abc');
      });

      testWidgets('Given function onTap is properly used', (tester) async {
        int functionCounter = 0;
        await tester.pumpWidget(TestUtils.buildTestableWidget(TmAdviceModal(
          key: key,
          title: '',
          clickableText: '',
          onTap: () {
            functionCounter++;
          },
        )));
        await tester.tap(find.byType(Container));
        await tester.pump();
        expect(functionCounter, 1);
        functionCounter = 0;
      });

      testWidgets('Given clickableText is properly used', (tester) async {
        await tester.pumpWidget(TestUtils.buildTestableWidget(TmAdviceModal(
          key: key,
          title: '',
          clickableText: 'Abc',
          onTap: () {},
        )));
        final clickableText = tester.widget<Text>(find.byKey(TmAdviceModal.clickableTextKey));
        expect(clickableText.data, 'Abc');
      });
    },
  );
}
