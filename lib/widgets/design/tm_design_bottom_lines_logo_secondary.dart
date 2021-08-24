import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TmDesignBottomLinesLogoSecondary extends StatelessWidget {
  const TmDesignBottomLinesLogoSecondary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 181,
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/line_logo_secondary_bot.svg',
            package: 'tm_lib_core',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/logo-trademaster.png',
                height: 22,
                width: 123,
              ),
            ),
          )
        ],
      ),
    );
  }
}
