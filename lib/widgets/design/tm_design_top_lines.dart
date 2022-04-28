import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../toolbar/tm_default_toolbar.dart';

class TmDesignTopLines extends StatelessWidget {
  final double iconSize;
  final VoidCallback? onPressed;
  final Widget centerWidget;
  final Widget rightWidget;
  final bool light;
  final bool toolbar;
  final bool haveButton;
	final Color? color;

  const TmDesignTopLines({
    Key? key,
    this.onPressed,
    this.iconSize = 38,
    this.centerWidget = const Text(''),
    this.rightWidget = const Text(''),
    required this.light,
    required this.toolbar,
    this.haveButton = true,
		this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (light)
          SvgPicture.asset(
            'assets/images/line_top_lighter.svg',
            package: 'tm_lib_core',
            alignment: Alignment.topRight,
            width: MediaQuery.of(context).size.width,
						color: color,
          ),
        if (!light)
          SvgPicture.asset(
            'assets/images/line_top.svg',
            package: 'tm_lib_core',
            alignment: Alignment.topRight,
            width: MediaQuery.of(context).size.width,
          ),
        if(toolbar)
        TmDefaultToolbar(
          haveButton: haveButton,
          centerWidget: centerWidget,
          onPressed: onPressed ?? Modular.to.pop,
          iconSize: iconSize,
          rightWidget: rightWidget,
        ),
      ],
    );
  }
}
