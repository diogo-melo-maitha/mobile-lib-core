import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configuration/trademaster_colors.dart';
import '../../configuration/trademaster_fonts.dart';

class TmDefaultButton extends StatelessWidget {
  static const Key absorbKey = Key('absorbKey');

  final bool disabled;
  final String title;
  final TextStyle? textStyle;
  final double height;
  final Color backgroundColor;
  final Color disabledColor;
  final Color? borderColor;
  final double borderSize;
  final VoidCallback onPressed;
  final double radius;
  final double elevation;

  const TmDefaultButton({
    Key? key,
    this.disabled = false,
    this.height = 54.0,
    this.backgroundColor = TmColors.primary,
    this.disabledColor = TmColors.primaryDisabled,
    this.radius = 50.0,
    this.borderColor,
    this.borderSize = 1.0,
    required this.onPressed,
    required this.title,
    this.textStyle,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle fontStyle = TmFonts.bold13
        .merge(const TextStyle(color: TmColors.white));

    return AbsorbPointer(
      key: absorbKey,
      absorbing: disabled,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: disabled == false ? backgroundColor : disabledColor,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
                color: borderColor ??
                    (disabled == false ? backgroundColor : disabledColor),
                width: borderSize),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: elevation,
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: textStyle == null
                  ? fontStyle
                  : fontStyle.merge(textStyle),
            ),
          ),
        ),
      ),
    );
  }
}
