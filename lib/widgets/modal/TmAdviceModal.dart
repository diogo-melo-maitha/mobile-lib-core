import 'package:flutter/material.dart';

import '../../configuration/tm_colors.dart';
import '../../configuration/tm_fonts.dart';

class TmAdviceModal extends StatelessWidget {
  final String title;
  final String clickableText;
  final Function() onTap;

  const TmAdviceModal({
    Key? key,
    required this.title,
    required this.clickableText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TmFonts.semiBold12.merge(
      const TextStyle(color: TmColors.turquoise),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        decoration: BoxDecoration(color: TmColors.adviceYellow, borderRadius: BorderRadius.circular(5)),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: textStyle,
            ),
            InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  clickableText,
                  style: textStyle.merge(const TextStyle(decoration: TextDecoration.underline)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
