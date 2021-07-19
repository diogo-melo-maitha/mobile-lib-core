import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/widgets/buttons/default_button.dart';
import 'package:flutter/material.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
  const key = Key('key');
  const String title = 'CADASTRE SUA EMPRESA';
  group('TmDefaultButton tests', () {
    testWidgets('TmDefaultButton is properly created', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultButton(
        key: key,
        title: title,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
      )));
      expect(find.byKey(key), findsOneWidget);
    });
    testWidgets('Given backgroundColor is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultButton(
        key: key,
        title: title,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
      )));
      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.blue);
    });
    testWidgets('Given title is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultButton(
        key: key,
        title: 'TRADEMASTER',
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
      )));
      final title = tester.widget<Text>(find.byType(Text));
      expect(title.data, 'TRADEMASTER');
    });
    testWidgets('Given textStyle is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultButton(
        key: key,
        title: title,
        textStyle: const TextStyle(color: Colors.amber),
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
      )));
      final titleColor = tester.widget<Text>(find.byType(Text));
      expect((titleColor.style as TextStyle).color, Colors.amber);
    });
    testWidgets('Given height is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultButton(
        key: key,
        title: title,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
        height: 400,
      )));
      final container = tester.widget<Container>(find.byType(Container));
      expect(container.constraints!.maxHeight, 400);
    });
    testWidgets('Given borderColor is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultButton(
        key: key,
        title: title,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
        height: 400,
        borderColor: Colors.black,
      )));
      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.border!.bottom.color, Colors.black);
    });
    testWidgets('Given borderSize is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultButton(
        key: key,
        title: title,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
        height: 400,
        borderColor: Colors.black,
        borderSize: 3,
      )));
      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.border!.bottom.width, 3);
    });
    testWidgets('Given radius is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultButton(
        key: key,
        title: title,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
        height: 400,
        borderColor: Colors.black,
        borderSize: 3,
        radius: 30,
      )));
      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect((decoration.borderRadius as BorderRadius).bottomRight.x, 30);
    });
    testWidgets('Given elevation is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultButton(
        key: key,
        title: title,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 3,
        height: 400,
        borderColor: Colors.black,
        borderSize: 3,
        radius: 30,
      )));

      final container = tester.widget<Container>(find.byType(Container));

      expect(
          ((container.decoration as BoxDecoration).boxShadow)!.single.blurRadius, 3);
    });

    testWidgets('Given function onPressed is working', (tester) async {
      int functionCounter = 0;
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultButton(
        key: key,
        title: title,
        backgroundColor: Colors.blue,
        onPressed: () {
          functionCounter++;
        },
        elevation: 3,
        height: 400,
        borderColor: Colors.black,
        borderSize: 3,
        radius: 30,
      )));
      await tester.tap(find.byType(Container));
      await tester.pump();
      expect(functionCounter, 1);
      functionCounter = 0;
    });
    testWidgets('Given bool disabled is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultButton(
        key: key,
        title: title,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
        height: 400,
        borderColor: Colors.black,
        disabled: true,
      )));

      final absorbPointer =
          tester.widget<AbsorbPointer>(find.byKey(TmDefaultButton.absorbKey));

      expect(absorbPointer.absorbing, true);
    });

    testWidgets('Given backgroundColor is properly used when disabled is true',
        (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultButton(
        key: key,
        title: title,
        disabledColor: Colors.white,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
        disabled: true,
      )));
      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.white);
    });
  });
}
