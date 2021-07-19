import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/widgets/textfields/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
  const key = Key('key');
  const TextStyle style = TextStyle(color: Colors.red);

  group('DefaultTextInput tests', () {
    testWidgets('DefaultTextInput is properly created', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: style,
      )));
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Given label is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        label: 'Trademaster',
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: style,
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration as InputDecoration;

      expect(decoration.labelText, 'Trademaster');
    });

    testWidgets('Given labelStyle is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        labelStyle: const TextStyle(color: Colors.red),
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: style,
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration as InputDecoration;

      expect((decoration.labelStyle as TextStyle).color, Colors.red);
    });

    testWidgets('Given borderSize is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        borderSize: 5,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: style,
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration as InputDecoration;
      final enabledBorder = decoration.enabledBorder as OutlineInputBorder;
      final borderSide = enabledBorder.borderSide;

      expect(borderSide.width, 5);
    });

    testWidgets('Given borderColor is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        borderColor: Colors.red,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: style,
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration as InputDecoration;
      final enabledBorder = decoration.enabledBorder as OutlineInputBorder;
      final borderSide = enabledBorder.borderSide;

      expect(borderSide.color, Colors.red);
    });

    testWidgets('Given focusedBorderSize is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        focusedBorderSize: 5,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: style,
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration as InputDecoration;
      final focusedBorder = decoration.focusedBorder as OutlineInputBorder;
      final borderSide = focusedBorder.borderSide;

      expect(borderSide.width, 5);
    });

    testWidgets('Given focusedBorderColor is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        focusedBorderColor: Colors.green,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: style,
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration as InputDecoration;
      final focusedBorder = decoration.focusedBorder as OutlineInputBorder;
      final borderSide = focusedBorder.borderSide;

      expect(borderSide.color, Colors.green);
    });

    testWidgets('Given Radius is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        radius: 10,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: style,
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration as InputDecoration;
      final focusedBorder = decoration.focusedBorder as OutlineInputBorder;
      final borderRadius = focusedBorder.borderRadius;

      expect(borderRadius.bottomRight.y, 10);
    });

    testWidgets('Given horizontalSymmetricPadding is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        radius: 10,
        horizontalSymmetricPadding: 30,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: style,
      )));

      final padding = tester.widget<Padding>(find.byType(Padding));

      expect(padding.padding.horizontal, 60);
    });

    testWidgets('Given autoFocus is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        autoFocus: true,
        radius: 10,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: style,
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));

      expect(textField.autofocus, true);
    });

    testWidgets('Given bool obscure is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        obscure: true,
        radius: 10,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: style,
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));

      expect(textField.obscureText, true);
    });

    testWidgets('Given bool enabled is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        enabled: false,
        radius: 10,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: style,
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));

      expect(textField.enabled, false);
    });

    testWidgets('Given widget is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        radius: 10,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: style,
        widget: const Icon(Icons.label),
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration as InputDecoration;
      final suffixIcon = decoration.suffixIcon;

      expect(suffixIcon, tester.widget<Icon>(find.byType(Icon)));
    });

    testWidgets('Given inputStyle is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        enabled: false,
        autoFocus: true,
        radius: 10,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: const TextStyle(color: Colors.amber),
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));

      expect((textField.style as TextStyle).color, Colors.amber);
    });

    testWidgets('Given function onChanged is working', (tester) async {
      const String editedText = 'editedText';
      String onChangedText = '';
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        enabled: false,
        radius: 10,
        onChanged: (text) {
          onChangedText = text;
        },
        onSubmitted: (text) {},
        inputStyle: style,
      )));
      final textField = tester.widget<TextField>(find.byType(TextField));
      textField.onChanged!(editedText);
      await tester.pump();
      expect(editedText, onChangedText);
    });

    testWidgets('Given function onSubmitted is working', (tester) async {
      const String editedText = 'editedText';
      String onChangedText = '';
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        enabled: false,
        radius: 10,
        onChanged: (text) {},
        onSubmitted: (text) {
          onChangedText = text;
        },
        inputStyle: style,
      )));
      final textField = tester.widget<TextField>(find.byType(TextField));
      textField.onSubmitted!(editedText);
      await tester.pump();
      expect(editedText, onChangedText);
    });

    testWidgets('Given cursorColor is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        enabled: false,
        autoFocus: true,
        cursorColor: Colors.blue,
        radius: 10,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: const TextStyle(color: Colors.black),
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));

      expect(textField.cursorColor, Colors.blue);
    });

    testWidgets('Given focusNode is properly used', (tester) async {
      expect(tester.testTextInput.isVisible, isFalse);

      final FocusNode focusNode = FocusNode(debugLabel: 'Editable Text Node');

      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        autoFocus: true,
        cursorColor: Colors.blue,
        focusNode: focusNode,
        radius: 10,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: const TextStyle(color: Colors.black),
      )));

      expect(tester.testTextInput.isVisible, isTrue);
      expect(focusNode.hasPrimaryFocus, isTrue);
    });

    testWidgets('Given keyboardType is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        autoFocus: true,
        keyboardType: TextInputType.number,
        radius: 10,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: const TextStyle(color: Colors.black),
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));

      expect(textField.keyboardType, TextInputType.number);
    });

    testWidgets('Given textEditingController is properly used', (tester) async {
      final TextEditingController _controller = TextEditingController();
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        autoFocus: true,
        textEditingController: _controller,
        radius: 10,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: const TextStyle(color: Colors.black),
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));

      expect(textField.controller, _controller);
    });

    testWidgets('Given inputFormatters is properly used', (tester) async {
      final TextInputFormatter testRegex =
          FilteringTextInputFormatter.deny(RegExp(r'[/\\]'));
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        autoFocus: true,
        inputFormatters: [testRegex],
        radius: 10,
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: const TextStyle(color: Colors.black),
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));

      expect(textField.inputFormatters, [testRegex]);
    });

    testWidgets('Given errorText is properly used', (tester) async {
      await tester.pumpWidget(TmTestUtils.buildTestableWidget(TmDefaultTextField(
        key: key,
        errorText: 'Texto vazio',
        onChanged: (value) {},
        onSubmitted: (value) {},
        inputStyle: style,
      )));

      final textField = tester.widget<TextField>(find.byType(TextField));
      final decoration = textField.decoration as InputDecoration;

      expect(decoration.errorText, 'Texto vazio');
    });
  });
}
