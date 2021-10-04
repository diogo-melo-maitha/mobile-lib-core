import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/tm_lib_core.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
	const key = Key('key');
  const String title = 'CADASTRE SUA EMPRESA';

	group('TmTextButton tests', () {
		testWidgets('TmDefaultButton is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmTextButton(
        key: key,
        title: title,
        onPressed: () {},

      )));
      expect(find.byKey(key), findsOneWidget);
    });

		testWidgets('Given textStyle is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmTextButton(
        key: key,
        title: title,
        onPressed: () {},
				textStyle: const TextStyle(
					color: Colors.blueAccent
				)
      )));

      final text = tester.widget<Text>(find.byType(Text));
      final style = text.style as TextStyle;
      expect(style.color, Colors.blueAccent);
    });

		testWidgets('Given horizontalPadding is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmTextButton(
        key: key,
        title: title,
        onPressed: () {},
				horizontalPadding: 20,
      )));

      final inkWell = tester.widget<InkWell>(find.byType(InkWell));
      final child = inkWell.child as Padding;
      expect(child.padding.horizontal, 40);
    });

		testWidgets('Given verticalPadding is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmTextButton(
        key: key,
        title: title,
        onPressed: () {},
				verticalPadding: 30,
      )));

      final inkWell = tester.widget<InkWell>(find.byType(InkWell));
      final child = inkWell.child as Padding;
      expect(child.padding.vertical, 60);
    });

		testWidgets('Given horizontalPadding when title is empty is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmTextButton(
        key: key,
        title: '',
        onPressed: () {},
				horizontalPadding: 20,
      )));

      final inkWell = tester.widget<InkWell>(find.byType(InkWell));
      final child = inkWell.child as Padding;
      expect(child.padding.horizontal, 0);
    });

		testWidgets('Given verticalPadding when title is empty is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmTextButton(
        key: key,
        title: '',
        onPressed: () {},
				verticalPadding: 30,
      )));

      final inkWell = tester.widget<InkWell>(find.byType(InkWell));
      final child = inkWell.child as Padding;
      expect(child.padding.vertical, 0);
    });
	});
}