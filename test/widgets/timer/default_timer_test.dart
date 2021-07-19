import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/widgets/timer/default_timer.dart';
import 'package:flutter/material.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
  const key = Key('key');
  const TextStyle style = TextStyle(color: Colors.red);

  group('TmDefaultTimer tests', () {
    testWidgets('TmDefaultTimer is properly created', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTimer(
        key: key,
        time: 50,
        timeLimit: 1,
        timeCallback: () {},
        textStyle: style,
      )));
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Given width is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTimer(
        key: key,
        time: 50,
        width: 90,
        timeLimit: 1,
        timeCallback: () {},
        textStyle: style,
      )));

      final container = tester.widget<Container>(find.byType(Container));
      final constraints = container.constraints;

      expect(constraints!.maxWidth, 90);
    });
    testWidgets('Given height is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTimer(
        key: key,
        time: 50,
        height: 400,
        timeLimit: 1,
        timeCallback: () {},
        textStyle: style,
      )));

      final container = tester.widget<Container>(find.byType(Container));
      final constraints = container.constraints;

      expect(constraints!.maxHeight, 400);
    });

    testWidgets('Given backgroundColor is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTimer(
        key: key,
        time: 50,
        backgroundColor: Colors.green,
        timeLimit: 1,
        timeCallback: () {},
        textStyle: style,
      )));

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.color, Colors.green);
    });

    testWidgets('Given borderColor is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTimer(
        key: key,
        time: 50,
        borderColor: Colors.amberAccent,
        timeLimit: 1,
        timeCallback: () {},
        textStyle: style,
      )));

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.border!.bottom.color, Colors.amberAccent);
    });

    testWidgets('Given borderSize is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTimer(
        key: key,
        time: 50,
        borderSize: 5,
        timeLimit: 1,
        timeCallback: () {},
        textStyle: style,
      )));

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.border!.bottom.width, 5);
    });

    testWidgets('Given radius is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTimer(
        key: key,
        time: 50,
        borderSize: 5,
        timeLimit: 1,
        timeCallback: () {},
        textStyle: style,
      )));

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      final borderRadius = decoration.borderRadius as BorderRadius;

      expect(borderRadius.bottomRight.y, 5);
    });

    testWidgets('Given textStyle is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTimer(
        key: key,
        time: 50,
        borderSize: 5,
        timeLimit: 1,
        timeCallback: () {},
        textStyle: const TextStyle(color: Colors.red),
      )));

      final text = tester.widget<Text>(find.byType(Text));

      expect((text.style as TextStyle).color, Colors.red);
    });

    testWidgets('Given function timeCallback is working', (tester) async {
      int testCounter = 0;
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTimer(
        key: key,
        time: 50,
        borderSize: 5,
        timeLimit: 1,
        timeCallback: () {
          testCounter++;
        },
        textStyle: style,
      )));

      await tester.tap(find.byType(InkWell));
      await tester.pump();

      expect(testCounter, 1);
      testCounter = 0;
    });

    testWidgets('Given time is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTimer(
        key: key,
        time: 30,
        borderSize: 5,
        timeLimit: 1,
        timeCallback: () {},
        textStyle: style,
      )));

      final text = tester.widget<Text>(find.byType(Text));

      expect(text.data, '30' 's');
    });
  });
}
