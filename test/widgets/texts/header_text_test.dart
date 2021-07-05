import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/texts/header_text.dart';

void main() {
  const key = Key('key');
  group('DefaultButton tests', () {
    testWidgets('HeaderText is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const HeaderText(
        key: key,
        bodyText: '',
        titleText: '',
      )));
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Given bodyText is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const HeaderText(
        key: key,
        bodyText: 'Abc',
        titleText: '',
      )));
      final text = tester.widget<Text>(find.byKey(HeaderText.bodyTextKey));
      expect(text.data, 'Abc');
    });

    testWidgets('Given titleText is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const HeaderText(
        key: key,
        bodyText: '',
        titleText: 'Trade',
      )));
      final text = tester.widget<Text>(find.byKey(HeaderText.titleTextKey));
      expect(text.data, 'Trade');
    });

    testWidgets('Given titleTextStyle is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const HeaderText(
        key: key,
        bodyText: '',
        titleText: '',
        titleTextStyle: TextStyle(color: Colors.amber),
      )));
      final titleStyle =
          tester.widget<Text>(find.byKey(HeaderText.titleTextKey));
      expect((titleStyle.style as TextStyle).color, Colors.amber);
    });

    testWidgets('Given titleTextStyle is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const HeaderText(
        key: key,
        bodyText: '',
        titleText: '',
        bodyTextStyle: TextStyle(color: Colors.brown),
      )));
      final titleStyle =
          tester.widget<Text>(find.byKey(HeaderText.bodyTextKey));
      expect((titleStyle.style as TextStyle).color, Colors.brown);
    });

    testWidgets(
        'Given titleLeftPadding and titleRightPadding are properly used',
        (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const HeaderText(
        key: key,
        bodyText: '',
        titleText: '',
        titleLeftPadding: 30,
        titleRightPadding: 20,
      )));
      final padding =
          tester.widget<Padding>(find.byKey(HeaderText.titlePaddingKey));
      expect((padding.padding as EdgeInsets).left, 30);
      expect((padding.padding as EdgeInsets).right, (20/375)*800);
    });

    testWidgets('Given bodyLeftPadding and bodyRightPadding are properly used',
        (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const HeaderText(
        key: key,
        bodyText: '',
        titleText: '',
        bodyLeftPadding: 40,
        bodyRightPadding: 10,
      )));
      final padding =
          tester.widget<Padding>(find.byKey(HeaderText.bodyPaddingKey));
      expect((padding.padding as EdgeInsets).left, 40);
      expect((padding.padding as EdgeInsets).right, (10/375)*800);
    });
  });
}
