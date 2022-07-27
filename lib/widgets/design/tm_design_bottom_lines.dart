import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TmDesignBottomLines extends StatelessWidget {
	final Color? color;
	final bool light;
  const TmDesignBottomLines({
		Key? key,
		this.light = false,
		this.color
	}) : super(key: key);

  @override
  Widget build(BuildContext context) {
		if (light) {
			return SvgPicture.asset(
				'assets/images/line_bot_lighter.svg',
				package: 'tm_lib_core',
				alignment: Alignment.bottomRight,
				width: MediaQuery.of(context).size.width,
				color: color,
			);
		}
		else {
			return SvgPicture.asset(
				'assets/images/line_bot.svg',
				package: 'tm_lib_core',
				alignment: Alignment.bottomRight,
				width: MediaQuery.of(context).size.width,
				color: color,
			);
		}
  }
}