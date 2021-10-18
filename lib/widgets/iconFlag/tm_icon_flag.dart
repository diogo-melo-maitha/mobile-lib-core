import 'package:flutter/material.dart';
import '../../configuration/tm_colors.dart';

class TmIconFlag extends StatelessWidget {
	final Widget icon;
	final bool showFlag;

	const TmIconFlag(
		this.icon, {
		this.showFlag = false,
		Key? key 
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Stack(
			alignment: Alignment.center,
			children: [
				icon,
				if (showFlag) Positioned(
						top: 0,
						left: 17,
						child: Container(
							width: 7,
							height: 7,
							alignment: Alignment.center,
							decoration: BoxDecoration(
								color: TmColors.error,
								borderRadius: BorderRadius.circular(5)
							)
						)
					) else Container()
			],
		);
	}
}