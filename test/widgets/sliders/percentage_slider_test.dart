import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/widgets/sliders/tm_percentage_slider.dart';
import 'package:flutter/material.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
  const key = Key('key');

  group('TmPercentageSlider tests', () {
    testWidgets('TmPercentageSlider is properly created', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        sliderCallback: (value) {},
      )));
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Given initialValue is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        initialValue: 70,
        sliderCallback: (value) {},
      )));
      final slider = tester.widget<Slider>(find.byType(Slider));

      expect(slider.value, 70);
    });

    testWidgets('Given max is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        max: 200,
        sliderCallback: (value) {},
      )));
      final slider = tester.widget<Slider>(find.byType(Slider));

      expect(slider.max, 200);
    });

    testWidgets('Given min is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        min: 20,
        sliderCallback: (value) {},
      )));
      final slider = tester.widget<Slider>(find.byType(Slider));

      expect(slider.min, 20);
    });

    testWidgets('Given sliderActiveColor and sliderInactiveColor are properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        sliderActiveColor: Colors.green,
        sliderInactiveColor: Colors.red,
        sliderCallback: (value) {},
      )));
      final sliderTheme = tester.widget<SliderTheme>(find.byType(SliderTheme));

      expect(sliderTheme.data.activeTrackColor, Colors.green);
      expect(sliderTheme.data.inactiveTrackColor, Colors.red);
    });

    testWidgets('Given function sliderCallback is working', (tester) async {
      const double editedValue = 99;
      double onChangedValue = 1;
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        sliderCallback: (value) {
          onChangedValue = value;
        },
        max: 150,
      )));
      final slider = tester.widget<Slider>(find.byType(Slider));
      slider.onChanged!(editedValue);
      await tester.pump();
      expect(editedValue, onChangedValue);
    });

    testWidgets('Given function sliderCallback is working when plusButton is pressed', (tester) async {
      const double editedValue = 99;
      double onChangedValue = 1;
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        sliderCallback: (value) {
          onChangedValue = editedValue;
        },
        max: 150,
      )));
      await tester.tap(find.byKey(TmPercentageSlider.plusButtonKey));
      await tester.pump();
      expect(onChangedValue, editedValue);
    });

    testWidgets('Given function sliderCallback is working when minusButton is pressed', (tester) async {
      const double editedValue = 99;
      double onChangedValue = 1;
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        sliderCallback: (value) {
          onChangedValue = editedValue;
        },
        max: 150,
      )));
      await tester.tap(find.byKey(TmPercentageSlider.minusButtonKey));
      await tester.pump();
      expect(onChangedValue, editedValue);
    });

    testWidgets('Given function sliderCallback is working when drag the Slider', (tester) async {
      const double editedValue = 99;
      double onChangedValue = 1;
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        sliderCallback: (value) {
          onChangedValue = editedValue;
        },
        max: 150,
      )));
      await tester.drag(find.byType(Slider), const Offset(100, 0));
      await tester.pump();
      expect(onChangedValue, editedValue);
    });

    testWidgets('Given title is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        title: 'Trademaster',
        sliderCallback: (value) {},
      )));
      final titleText = tester.widget<Text>(find.byKey(TmPercentageSlider.titleTextKey));

      expect(titleText.data, 'Trademaster');
    });

    testWidgets('Given subtitle is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        subTitle: 'Top',
        sliderCallback: (value) {},
      )));
      final subtitleText = tester.widget<Text>(find.byKey(TmPercentageSlider.subtitleTextKey));

      expect(subtitleText.data, 'Top');
    });

    testWidgets('Given titleTextStyle is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        titleTextStyle: const TextStyle(color: Colors.black),
        sliderCallback: (value) {},
      )));
      final titleText = tester.widget<Text>(find.byKey(TmPercentageSlider.titleTextKey));

      expect((titleText.style as TextStyle).color, Colors.black);
    });

    testWidgets('Given subtitleTextStyle is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        subtitleTextStyle: const TextStyle(color: Colors.green),
        sliderCallback: (value) {},
      )));
      final subtitleText = tester.widget<Text>(find.byKey(TmPercentageSlider.subtitleTextKey));

      expect((subtitleText.style as TextStyle).color, Colors.green);
    });

    testWidgets('Given numberStyle is properly used', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        numberStyle: const TextStyle(color: Colors.amber),
        sliderCallback: (value) {},
      )));
      final numberText = tester.widget<Text>(find.byKey(TmPercentageSlider.numberTextKey));

      expect((numberText.style as TextStyle).color, Colors.amber);
    });

    testWidgets('Given iconSize is properly used on plus button', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        iconSize: 40,
        sliderCallback: (value) {},
      )));
      final iconButton = tester.widget<IconButton>(find.byKey(TmPercentageSlider.plusButtonKey));

      expect(iconButton.iconSize, 40);
    });

    testWidgets('Given iconSize is properly used on minus button', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        iconSize: 30,
        sliderCallback: (value) {},
      )));
      final iconButton = tester.widget<IconButton>(find.byKey(TmPercentageSlider.minusButtonKey));

      expect(iconButton.iconSize, 30);
    });

    testWidgets('Given iconColor is properly used on plus button', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        iconColor: Colors.green,
        sliderCallback: (value) {},
      )));
      final iconButton = tester.widget<IconButton>(find.byKey(TmPercentageSlider.plusButtonKey));
      final container = iconButton.icon as Container;
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.color, Colors.green);
    });

    testWidgets('Given iconColor is properly used on minus button', (tester) async {
      await tester.pumpWidget(TestUtils.buildTestableWidget(TmPercentageSlider(
        key: key,
        iconColor: Colors.red,
        sliderCallback: (value) {},
      )));
      final iconButton = tester.widget<IconButton>(find.byKey(TmPercentageSlider.minusButtonKey));
      final container = iconButton.icon as Container;
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.color, Colors.red);
    });
  });
}
