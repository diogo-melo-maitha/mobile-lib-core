import 'package:flutter_test/flutter_test.dart';
import 'package:tm_lib_core/configuration/tm_colors.dart';
import 'package:tm_lib_core/widgets/stepper/tm_on_boarding_stepper.dart';
import 'package:flutter/material.dart';
import 'package:tm_lib_core/utils/test_utils.dart';

void main() {
  const key = Key('key');
  group('DefaultStepper tests', () {
    testWidgets('DefaultButton is properly created', (tester) async {
      await tester
          .pumpWidget(TestUtils.buildTestableWidget(const TmOnBoardingStepper(
        key: key,
        state: 1,
      )));
      expect(find.byKey(key), findsOneWidget);
    });

    testWidgets('Given backColor is properly used', (tester) async {
      await tester
          .pumpWidget(TestUtils.buildTestableWidget(const TmOnBoardingStepper(
        key: key,
        state: 1,
        backColor: Colors.red,
      )));
      final backShape = tester
          .widget<Container>(find.byKey(TmOnBoardingStepper.backShapeKey));

      expect((backShape.decoration as BoxDecoration).color, Colors.red);
    });

    testWidgets('Given filledColor is properly used', (tester) async {
      await tester
          .pumpWidget(TestUtils.buildTestableWidget(const TmOnBoardingStepper(
        key: key,
        state: 1,
        filledColor: Colors.amberAccent,
      )));
      final frontShape = tester
          .widget<Container>(find.byKey(TmOnBoardingStepper.frontShapeKey));

      expect(frontShape.color, Colors.amberAccent);
    });

    testWidgets('Given state 1 is properly applied', (tester) async {
      await tester
          .pumpWidget(TestUtils.buildTestableWidget(const TmOnBoardingStepper(
        key: key,
        state: 1,
      )));
      final frontShape = tester
          .widget<Container>(find.byKey(TmOnBoardingStepper.frontShapeKey));
      final backShape = tester
          .widget<Container>(find.byKey(TmOnBoardingStepper.backShapeKey));
      expect(frontShape.constraints!.maxWidth,
          (0 / 100) * backShape.constraints!.maxWidth);

      final firstText =
          tester.widget<Text>(find.byKey(TmOnBoardingStepper.firstTextKey));
      final secondText =
          tester.widget<Text>(find.byKey(TmOnBoardingStepper.secondTextKey));
      final thirdText =
          tester.widget<Text>(find.byKey(TmOnBoardingStepper.thirdTextKey));

      expect((firstText.style as TextStyle).color, TmColors.accent);
      expect((secondText.style as TextStyle).color, TmColors.disabledText);
      expect((thirdText.style as TextStyle).color, TmColors.disabledText);
    });

    testWidgets('Given state 2 is properly applied', (tester) async {
      await tester
          .pumpWidget(TestUtils.buildTestableWidget(const TmOnBoardingStepper(
        key: key,
        state: 2,
      )));
      final frontShape = tester
          .widget<Container>(find.byKey(TmOnBoardingStepper.frontShapeKey));
      final backShape = tester
          .widget<Container>(find.byKey(TmOnBoardingStepper.backShapeKey));
      expect(frontShape.constraints!.maxWidth,
          (25 / 100) * backShape.constraints!.maxWidth);

      final firstText =
          tester.widget<Text>(find.byKey(TmOnBoardingStepper.firstTextKey));
      final secondText =
          tester.widget<Text>(find.byKey(TmOnBoardingStepper.secondTextKey));
      final thirdText =
          tester.widget<Text>(find.byKey(TmOnBoardingStepper.thirdTextKey));

      expect((firstText.style as TextStyle).color, TmColors.accent);
      expect((secondText.style as TextStyle).color, TmColors.disabledText);
      expect((thirdText.style as TextStyle).color, TmColors.disabledText);
    });

    testWidgets('Given state 3 is properly applied', (tester) async {
      await tester
          .pumpWidget(TestUtils.buildTestableWidget(const TmOnBoardingStepper(
        key: key,
        state: 3,
      )));
      final frontShape = tester
          .widget<Container>(find.byKey(TmOnBoardingStepper.frontShapeKey));
      final backShape = tester
          .widget<Container>(find.byKey(TmOnBoardingStepper.backShapeKey));
      expect(frontShape.constraints!.maxWidth,
          (50 / 100) * backShape.constraints!.maxWidth);

      final firstText =
          tester.widget<Text>(find.byKey(TmOnBoardingStepper.firstTextKey));
      final secondText =
          tester.widget<Text>(find.byKey(TmOnBoardingStepper.secondTextKey));
      final thirdText =
          tester.widget<Text>(find.byKey(TmOnBoardingStepper.thirdTextKey));

      expect((firstText.style as TextStyle).color, TmColors.accent);
      expect((secondText.style as TextStyle).color, TmColors.accent);
      expect((thirdText.style as TextStyle).color, TmColors.disabledText);
    });

    testWidgets('Given state 4 is properly applied', (tester) async {
      await tester
          .pumpWidget(TestUtils.buildTestableWidget(const TmOnBoardingStepper(
        key: key,
        state: 4,
      )));
      final frontShape = tester
          .widget<Container>(find.byKey(TmOnBoardingStepper.frontShapeKey));
      final backShape = tester
          .widget<Container>(find.byKey(TmOnBoardingStepper.backShapeKey));
      expect(frontShape.constraints!.maxWidth,
          (75 / 100) * backShape.constraints!.maxWidth);

      final firstText =
          tester.widget<Text>(find.byKey(TmOnBoardingStepper.firstTextKey));
      final secondText =
          tester.widget<Text>(find.byKey(TmOnBoardingStepper.secondTextKey));
      final thirdText =
          tester.widget<Text>(find.byKey(TmOnBoardingStepper.thirdTextKey));

      expect((firstText.style as TextStyle).color, TmColors.accent);
      expect((secondText.style as TextStyle).color, TmColors.accent);
      expect((thirdText.style as TextStyle).color, TmColors.disabledText);
    });

    testWidgets('Given state 5 is properly applied', (tester) async {
      await tester
          .pumpWidget(TestUtils.buildTestableWidget(const TmOnBoardingStepper(
        key: key,
        state: 5,
      )));
      final frontShape = tester
          .widget<Container>(find.byKey(TmOnBoardingStepper.frontShapeKey));
      final backShape = tester
          .widget<Container>(find.byKey(TmOnBoardingStepper.backShapeKey));
      expect(frontShape.constraints!.maxWidth,
          (100 / 100) * backShape.constraints!.maxWidth);

      final firstText =
          tester.widget<Text>(find.byKey(TmOnBoardingStepper.firstTextKey));
      final secondText =
          tester.widget<Text>(find.byKey(TmOnBoardingStepper.secondTextKey));
      final thirdText =
          tester.widget<Text>(find.byKey(TmOnBoardingStepper.thirdTextKey));

      expect((firstText.style as TextStyle).color, TmColors.accent);
      expect((secondText.style as TextStyle).color, TmColors.accent);
      expect((thirdText.style as TextStyle).color, TmColors.disabledText);
    });
  });
}
