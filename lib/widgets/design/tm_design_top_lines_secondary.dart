import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TmDesignTopLinesSecondary extends StatelessWidget {
  const TmDesignTopLinesSecondary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/line_top_secondary.svg',
      package: 'tm_lib_core',
      alignment: Alignment.topRight,
      width: MediaQuery.of(context).size.width,
    );
  }
}


