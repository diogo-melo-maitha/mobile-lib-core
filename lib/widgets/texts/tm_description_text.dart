import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../configuration/tm_colors.dart';
import '../../configuration/tm_fonts.dart';

class TmDescriptionText extends StatelessWidget {
  static const Key descriptionTextKey = Key('descriptionTextKey');
  static const Key valueTextKey = Key('valueTextKey');

  final String descriptionText;
  final String valueText;
  final TextStyle? valueTextStyle;

  const TmDescriptionText({
    Key? key,
    required this.descriptionText,
    required this.valueText,
    this.valueTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle valueStyle = TmFonts.semiBold14.merge(const TextStyle(color: TmColors.lightGrey));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 2,
          ),
          child: Text(
            descriptionText,
            key: descriptionTextKey,
            style: TmFonts.regular12.merge(const TextStyle(color: TmColors.shadow)),
          ),
        ),
        Text(
          valueText,
          key: valueTextKey,
          style: valueTextStyle ?? valueStyle,
        ),
      ],
    );
  }
}
