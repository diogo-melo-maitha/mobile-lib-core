import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tm_lib_core/configuration/tm_colors.dart';
import 'package:tm_lib_core/utils/test_utils.dart';
import 'package:tm_lib_core/widgets/texts/tm_description_text.dart';

void main() {
  const key = Key('key');
  group('TmDescriptionText tests', () {
    testWidgets('TmDescriptionText is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmDescriptionText(
        key: key,
        descriptionText: '',
        valueText: '',
      )));
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Given descriptionText is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmDescriptionText(
        key: key,
        descriptionText: 'description',
        valueText: '',
      )));
      final descriptionText = tester.widget<Text>(find.byKey(TmDescriptionText.descriptionTextKey));
      expect(descriptionText.data, 'description');
    });

    testWidgets('Given valueText is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmDescriptionText(
        key: key,
        descriptionText: '',
        valueText: 'value',
      )));
      final valueText = tester.widget<Text>(find.byKey(TmDescriptionText.valueTextKey));
      expect(valueText.data, 'value');
    });

    testWidgets('Given valueTextStyle is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(const TmDescriptionText(
        key: key,
        descriptionText: '',
        valueText: 'value',
        valueTextStyle: TextStyle(color: TmColors.primary),
      )));
      final valueText = tester.widget<Text>(find.byKey(TmDescriptionText.valueTextKey));
      expect((valueText.style as TextStyle).color, TmColors.primary);
    });
  });
}
