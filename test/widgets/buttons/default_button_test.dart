import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/widgets/buttons/default_button.dart';
import 'package:flutter/material.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
  const key = Key('key');
  const String title = 'CADASTRE SUA EMPRESA';
  group('DefaultButton tests', () {
    testWidgets('DefaultButton is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultButton(
        key: key,
        title: title,
        titleColor: Colors.white,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
      )));
      expect(find.byKey(key), findsOneWidget);
    });
    testWidgets('Testing customization backgroundColor', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultButton(
        key: key,
        title: title,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
      )));
      final ink = tester.widget<Ink>(find.byType(Ink));
      final decoration = ink.decoration as BoxDecoration;
      expect(decoration.color, Colors.blue);
    });
    testWidgets('Testing customization title', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultButton(
        key: key,
        title: 'TRADEMASTER',
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
      )));
      final title = tester.widget<Text>(find.byType(Text));
      expect(title.data, 'TRADEMASTER');
    });
    testWidgets('Testing customization titleColor', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultButton(
        key: key,
        title: title,
        titleColor: Colors.red,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
      )));
      final titleColor = tester.widget<Text>(find.byType(Text));
      expect((titleColor.style as TextStyle).color, Colors.red);
    });
    testWidgets('Testing customization width', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultButton(
        key: key,
        title: title,
        titleColor: Colors.red,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
        width: 400,
      )));
      final ink = tester.widget<Ink>(find.byType(Ink));
      expect(ink.width, 400);
    });
    testWidgets('Testing customization height', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultButton(
        key: key,
        title: title,
        titleColor: Colors.red,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
        height: 400,
      )));
      final ink = tester.widget<Ink>(find.byType(Ink));
      expect(ink.height, 400);
    });
    testWidgets('Testing customization borderColor', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultButton(
        key: key,
        title: title,
        titleColor: Colors.red,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
        height: 400,
        borderColor: Colors.black,
      )));
      final ink = tester.widget<Ink>(find.byType(Ink));
      final decoration = ink.decoration as BoxDecoration;
      expect(decoration.border!.bottom.color, Colors.black);
    });
    testWidgets('Testing customization borderSize', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultButton(
        key: key,
        title: title,
        titleColor: Colors.red,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
        height: 400,
        borderColor: Colors.black,
        borderSize: 3,
      )));
      final ink = tester.widget<Ink>(find.byType(Ink));
      final decoration = ink.decoration as BoxDecoration;
      expect(decoration.border!.bottom.width, 3);
    });
    testWidgets('Testing customization radius', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultButton(
        key: key,
        title: title,
        titleColor: Colors.red,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
        height: 400,
        borderColor: Colors.black,
        borderSize: 3,
        radius: 30,
      )));
      final ink = tester.widget<Ink>(find.byType(Ink));
      final decoration = ink.decoration as BoxDecoration;
      expect((decoration.borderRadius as BorderRadius).bottomRight.x, 30);
    });
    testWidgets('Testing customization elevation', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultButton(
        key: key,
        title: title,
        titleColor: Colors.red,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 3,
        height: 400,
        borderColor: Colors.black,
        borderSize: 3,
        radius: 30,
      )));

      final ink = tester.widget<Ink>(find.byType(Ink));

      expect(((ink.decoration as BoxDecoration).boxShadow)!.single.blurRadius, 3);
    });

    testWidgets('Testing customization onPressed', (tester) async {
      int functionCounter = 0;
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultButton(
        key: key,
        title: title,
        titleColor: Colors.red,
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
      await tester.tap(find.byType(Ink));
      await tester.pump();
      expect(functionCounter, 1);
      functionCounter = 0;
    });
    testWidgets('Testing customization disabled', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultButton(
        key: key,
        title: title,
        titleColor: Colors.red,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
        height: 400,
        borderColor: Colors.black,
        disabled: true,
      )));

      final absorbPointer = tester.widget<AbsorbPointer>(find.byKey(const Key('absorbkey')));

      expect(absorbPointer.absorbing, true);
    });

    testWidgets('Testing customization backgroundColor when disabled is true', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(DefaultButton(
        key: key,
        title: title,
        disabledColor: Colors.white,
        backgroundColor: Colors.blue,
        onPressed: () {},
        elevation: 1,
        disabled: true,
      )));
      final ink = tester.widget<Ink>(find.byType(Ink));
      final decoration = ink.decoration as BoxDecoration;
      expect(decoration.color, Colors.white);
    });
  });
}
