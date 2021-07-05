import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../configuration/trademaster_colors.dart';
import '../../configuration/trademaster_fonts.dart';

class HeaderText extends StatelessWidget {
  static const Key titlePaddingKey = Key('titlePaddingKey');
  static const Key bodyPaddingKey = Key('bodyPaddingKey');
  static const Key titleTextKey = Key('titleKey');
  static const Key bodyTextKey = Key('bodyKey');

  final String titleText;
  final TextStyle? titleTextStyle;
  final String bodyText;
  final TextStyle? bodyTextStyle;
  final double titleLeftPadding;
  final double titleRightPadding;
  final double bodyLeftPadding;
  final double bodyRightPadding;

  const HeaderText({
    Key? key,
    required this.titleText,
    required this.bodyText,
    this.titleTextStyle,
    this.bodyTextStyle,
    this.titleLeftPadding = 24,
    this.titleRightPadding = 77,
    this.bodyLeftPadding = 24,
    this.bodyRightPadding = 59,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleFontStyle = TrademasterFonts.regular32.merge(const TextStyle(color: TrademasterColors.accent));

    final TextStyle bodyFontStyle =
        TrademasterFonts.regular16.merge(const TextStyle(color: TrademasterColors.textOnSurface));

    final double calculatedTitleRightPadding = MediaQuery.of(context).size.width * (titleRightPadding / 375);
    final double calculatedBodyRightPadding = MediaQuery.of(context).size.width * (bodyRightPadding / 375);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          key: titlePaddingKey,
          padding: EdgeInsets.only(
            left: titleLeftPadding,
            right: calculatedTitleRightPadding,
          ),
          child: Text(
            titleText,
            key: titleTextKey,
            style: titleTextStyle == null ? titleFontStyle : titleFontStyle.merge(titleTextStyle),
          ),
        ),
        Padding(
          key: bodyPaddingKey,
          padding: EdgeInsets.only(
            left: bodyLeftPadding,
            right: calculatedBodyRightPadding,
          ),
          child: Text(
            bodyText,
            key: bodyTextKey,
            style: bodyTextStyle == null ? bodyFontStyle : bodyFontStyle.merge(bodyTextStyle),
          ),
        ),
      ],
    );
  }
}
