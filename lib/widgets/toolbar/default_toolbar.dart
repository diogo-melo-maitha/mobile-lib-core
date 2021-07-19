import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import '../../configuration/trademaster_colors.dart';
import '../../configuration/trademaster_fonts.dart';

class TmDefaultToolbar extends StatelessWidget {
  final String title;
  final double iconSize;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final Widget rightWidget;

  const TmDefaultToolbar({
    Key? key,
    this.title = ' ',
    this.onPressed,
    this.textStyle,
    this.iconSize = 38,
    this.rightWidget = const Text(' '),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle toolbarText = TmFonts.semiBold17.merge(const TextStyle(color: TmColors.primary));

    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 6,
          bottom: 16,
          left: 24,
          right: 24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(iconSize),
              ),
              child: IconButton(
                splashRadius: 0.1,
                iconSize: iconSize,
                onPressed: onPressed ?? Modular.to.pop,
                icon: SvgPicture.asset(
                  'assets/images/left_chevron.svg',
                  package: 'tm_lib_core',
                  width: iconSize,
                  height: iconSize,
                ),
              ),
            ),
            Text(
              title,
              style: textStyle == null ? toolbarText : toolbarText.merge(textStyle),
            ),
            rightWidget,
          ],
        ),
      ),
    );
  }
}
