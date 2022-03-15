import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../tm_lib_core.dart';

class TmDotIndicator extends StatefulWidget {
	final int dotLength;
	final int activeIndex;

	const TmDotIndicator({
		required this.activeIndex,
		required this.dotLength,
		Key? key
	}) : super(key: key);

	@override
	State<TmDotIndicator> createState() => _TmDotIndicatorState();
}

class _TmDotIndicatorState extends State<TmDotIndicator> {
	@override
	Widget build(BuildContext context) {
		return DotsIndicator(
			dotsCount: widget.dotLength,
			position: widget.activeIndex.toDouble(),
			decorator: DotsDecorator(
				color: TmColors.primary.withOpacity(0.5),
				activeColor: TmColors.primary,
				size: const Size.square(7),
				activeSize: const Size.square(7),
				spacing: const EdgeInsets.all(5),
			),
		);
	}
}