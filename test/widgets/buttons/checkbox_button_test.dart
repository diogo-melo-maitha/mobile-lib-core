import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/widgets/buttons/checkbox_button.dart';
import 'package:flutter/material.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
  const key = Key('key');
  const String title = 'title';

  group('CheckboxButton tests', () {
    testWidgets('CheckboxButton is properly created', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          CheckboxButton(
            key: key,
            backgroundColor: Colors.white,
            checkboxCallback: (value) {},
            onPressed: () {},
            primaryColor: Colors.blue,
            title: title,
          ),
        ),
      );
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Given backgroundColor is properly used', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          CheckboxButton(
            key: key,
            checkboxCallback: (value) {},
            onPressed: () {},
            primaryColor: Colors.blue,
            title: title,
          ),
        ),
      );

      final ink = tester.widget<Ink>(find.byType(Ink));
      final decoration = ink.decoration as BoxDecoration;

      expect(decoration.color, Colors.white);
    });

    testWidgets('Given title is properly used', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          CheckboxButton(
            key: key,
            checkboxCallback: (value) {},
            onPressed: () {},
            primaryColor: Colors.blue,
            title: 'TRADEMASTER',
          ),
        ),
      );

      final title = tester.widget<Text>(find.byType(Text));

      expect(title.data, 'TRADEMASTER');
    });

    testWidgets('Given titleColor is properly used', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          CheckboxButton(
            key: key,
            checkboxCallback: (value) {},
            onPressed: () {},
            primaryColor: Colors.blue,
            title: title,
          ),
        ),
      );

      final titleColor = tester.widget<Text>(find.byType(Text));

      expect((titleColor.style as TextStyle).color, Colors.black);
    });

    testWidgets('Given borderColor is properly used', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          CheckboxButton(
            key: key,
            checkboxCallback: (value) {},
            onPressed: () {},
            primaryColor: Colors.blue,
            title: title,
            borderColor: Colors.black,
          ),
        ),
      );

      final ink = tester.widget<Ink>(find.byType(Ink));
      final decoration = ink.decoration as BoxDecoration;

      expect(decoration.border!.bottom.color, Colors.black);
    });

    testWidgets('Given function onPressed is working', (tester) async {
      int functionCounter = 0;
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          CheckboxButton(
            key: key,
            checkboxCallback: (value) {},
            onPressed: () {
              functionCounter++;
            },
            primaryColor: Colors.blue,
            title: title,
          ),
        ),
      );

      await tester.tap(find.byType(Ink));

      await tester.pump();

      expect(functionCounter, 1);
      functionCounter = 0;
    });

    testWidgets('Given function checkboxCallback is working', (tester) async {
      bool checkBool = false;
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          CheckboxButton(
            key: key,
            checkboxCallback: (value) {
              checkBool = true;
            },
            onPressed: () {},
            primaryColor: Colors.blue,
            title: title,
          ),
        ),
      );

      await tester.tap(find.byType(Checkbox));

      await tester.pump();

      expect(checkBool, true);
      checkBool = false;
    });
  });
}
