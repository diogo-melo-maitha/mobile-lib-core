import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configuration/trademaster_colors.dart';
import '../../configuration/trademaster_fonts.dart';

class TmOnBoardingStepper extends StatelessWidget {
  static const Key backShapeKey = Key('backShapeKey');
  static const Key frontShapeKey = Key('frontShapeKey');
  static const Key firstTextKey = Key('firstTextKey');
  static const Key secondTextKey = Key('secondTextKey');
  static const Key thirdTextKey = Key('thirdTextKey');

  final Color backColor;
  final Color filledColor;
  ///State is controlled using numbers from 1 to 5, where 1 is 0% and 5 is 100%
  final int state;

  const TmOnBoardingStepper({
    Key? key,
    this.backColor = TmColors.disabled,
    this.filledColor = TmColors.accent,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle filledTextStyle = TmFonts.bold12.merge(const TextStyle(color: TmColors.accent));
    final TextStyle disabledTextStyle =
        TmFonts.bold12.merge(const TextStyle(color: TmColors.disabledText));

    return Container(
      width: 335,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('EMPRESA', key: firstTextKey, style: filledTextStyle),
              Text(
                'DONO/SÓCIO',
                key: secondTextKey,
                style: state == 1 || state == 2 ? disabledTextStyle : filledTextStyle,
              ),
              Text('SENHA', key: thirdTextKey, style: disabledTextStyle),
            ],
          ),
          if (state == 1 || state == 2)
            Padding(
              padding: const EdgeInsets.only(left: 7, right: 7, top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          width: 320,
                          height: 24,
                        ),
                        Positioned(right: 4, left: 4, bottom: 7, top: 7, child: buildBackShape()),
                        Positioned(
                            width: buildFrontShape().constraints!.maxWidth,
                            bottom: 7,
                            top: 7,
                            child: buildFrontShape()),
                        Positioned(bottom: 1, top: 1, left: -2, child: buildBigMarker()),
                      ],
                    ),
                  )
                ],
              ),
            )
          else
            state == 3 || state == 4
                ? Padding(
                    padding: const EdgeInsets.only(left: 7, right: 7, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                width: 320,
                                height: 24,
                              ),
                              Positioned(right: 4, left: 4, bottom: 7, top: 7, child: buildBackShape()),
                              Positioned(
                                  width: buildFrontShape().constraints!.maxWidth,
                                  bottom: 7,
                                  top: 7,
                                  child: buildFrontShape()),
                              Positioned(bottom: 1, top: 1, left: 1, right: 1, child: buildBigMarker()),
                              Positioned(bottom: 1, top: 1, left: -2, child: buildBigMarker()),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 7, right: 7, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                width: 320,
                                height: 24,
                              ),
                              Positioned(right: 4, left: 4, bottom: 7, top: 7, child: buildBackShape()),
                              Positioned(
                                  width: buildFrontShape().constraints!.maxWidth,
                                  bottom: 7,
                                  top: 7,
                                  child: buildFrontShape()),
                              Positioned(bottom: 1, top: 1, left: 1, right: 1, child: buildBigMarker()),
                              Positioned(bottom: 1, top: 1, left: -2, child: buildBigMarker()),
                              Positioned(bottom: 1, top: 1, right: -2, child: buildBigMarker()),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
        ],
      ),
    );
  }

  double calculateStepperPercentage() {
    double percentage = 0;

    switch (state) {
      case 1:
        percentage = 0;
        break;

      case 2:
        percentage = 25;
        break;

      case 3:
        percentage = 50;
        break;

      case 4:
        percentage = 75;
        break;

      default:
        percentage = 100;
    }

    return percentage;
  }

  Widget buildSmallMarker() {
    return Container(width: 4, height: 4, decoration: BoxDecoration(color: filledColor, shape: BoxShape.circle));
  }

  Widget buildBigMarker() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: filledColor,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xfffafafa), width: 3),
      ),
    );
  }

  Widget buildBackShape() {
    return Container(
      key: backShapeKey,
      width: 314,
      height: 10,
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: buildSmallMarker(),
          ),
          buildSmallMarker(),
          Padding(
            padding: const EdgeInsets.only(right: 3),
            child: buildSmallMarker(),
          )
        ],
      ),
    );
  }

  Container buildFrontShape() {
    return Container(
      key: frontShapeKey,
      width: (calculateStepperPercentage() / 100) * 314,
      height: 10,
      color: filledColor,
    );
  }
}
