import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TmDesignBottomLines extends StatelessWidget {
  const TmDesignBottomLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/line_bot.svg',
      package: 'tm_lib_core',
      alignment: Alignment.bottomRight,
      width: MediaQuery.of(context).size.width,
    );
  }
}