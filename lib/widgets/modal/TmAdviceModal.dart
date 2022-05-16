import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configuration/tm_colors.dart';
import '../../configuration/tm_fonts.dart';

class TmAdviceModal extends StatelessWidget {
  final String title;
  final String clickableText;

  const TmAdviceModal({
    Key? key,
    required this.clickableText,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle fontStyle = TmFonts.bold13.merge(const TextStyle(color: TmColors.white));

    return Container();
  }
}
