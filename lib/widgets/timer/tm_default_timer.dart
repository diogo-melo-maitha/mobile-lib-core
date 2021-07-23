import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configuration/tm_colors.dart';
import '../../configuration/tm_fonts.dart';

const Color timerBackgroundColor = Color(0xffF4F4F4);

class TmDefaultTimer extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color? borderColor;
  final double borderSize;
  final double radius;
  final VoidCallback timeCallback;
  final int time;
  final int timeLimit;
  final TextStyle? textStyle;

  const TmDefaultTimer({
    Key? key,
    this.width = 70,
    this.height = 40,
    this.backgroundColor = timerBackgroundColor,
    this.borderColor,
    this.borderSize = 0,
    this.radius = 5,
    required this.timeCallback,
    required this.time,
    required this.timeLimit,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle fontStyleText = TmFonts.bold14
        .merge(const TextStyle(color: TmColors.textOnSurface));

    return InkWell(
      onTap: timeCallback,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
              color: borderColor ?? backgroundColor, width: borderSize),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$time' 's',
              style: textStyle == null
                  ? fontStyleText
                  : fontStyleText.merge(textStyle),
            ),
          ],
        ),
      ),
    );
  }
}
