import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/dropDown/dropdown_button.dart';

void main() {
  group('DropdownButton tests', () {
    const key = Key('key');

    testWidgets('TmDropdownButton is properly created', (tester) async {
      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          TmDropdownButton(
            key: key,
            label: 'Label',
            onChanged: (value) {},
            list: const [],
          ),
        ),
      );
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Given menuMaxHeight is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmDropdownButton(
        key: key,
        label: 'Label',
        onChanged: (value) {},
        list: const [],
        menuMaxHeight: 300,
      )));

      final buttonTheme = tester.widget<ButtonTheme>(find.byType(ButtonTheme));
      final pointer = buttonTheme.child as AbsorbPointer;
      final dropdownButton = pointer.child as DropdownButton<String>;
      expect(dropdownButton.menuMaxHeight, 300);
    });

    testWidgets('Given onChange is properly used', (tester) async {
      int validTest = 0;

      await tester.pumpWidget(TestUtils.buildTestableWidget(TmDropdownButton(
          key: key,
          label: 'Label',
          onChanged: (value) {
            validTest++;
          },
          list: const [])));

      final buttonTheme = tester.widget<ButtonTheme>(find.byType(ButtonTheme));
      final pointer = buttonTheme.child as AbsorbPointer;
      final dropdownButton = pointer.child as DropdownButton<String>;

      dropdownButton.onChanged!('');
      expect(validTest, 1);
      validTest = 0;
    });
  });
}
