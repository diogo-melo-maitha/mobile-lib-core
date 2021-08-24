import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configuration/tm_colors.dart';
import '../../configuration/tm_fonts.dart';

class TmTextButton extends StatelessWidget {
  final bool disabled;
  final String title;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final double horizontalPadding;
  final double verticalPadding;

  const TmTextButton({
    Key? key,
    this.disabled = false,
    required this.onPressed,
    required this.title,
    this.textStyle,
    this.horizontalPadding = 10,
    this.verticalPadding = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle fontStyle = TmFonts.semiBold16.merge(const TextStyle(color: TmColors.primary));

    return AbsorbPointer(
      absorbing: disabled,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: title != '' ? horizontalPadding : 0, vertical: title != '' ? verticalPadding : 0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: textStyle == null ? fontStyle : fontStyle.merge(textStyle),
          ),
        ),
      ),
    );
  }
}
