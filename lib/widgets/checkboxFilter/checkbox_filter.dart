import 'package:flutter/material.dart';

import '../../tm_lib_core.dart';

class TmCheckboxFilter extends StatefulWidget {
	final String text;
	final bool value;
	final Function(bool) onChange;

	const TmCheckboxFilter({
		Key? key,
		required this.text,
		required this.value,
		required this.onChange
	}) : super(key: key);

	@override
	State<TmCheckboxFilter> createState() => _TmCheckboxFilterState();
}

class _TmCheckboxFilterState extends State<TmCheckboxFilter> {
	@override
	Widget build(BuildContext context) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: [
				Text(
					widget.text,
					style: TmFonts.regular14,
				),
				Checkbox(
					shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
					activeColor: TmColors.ice,
					value: widget.value,
					onChanged: (value) => widget.onChange(value!),
					side: const BorderSide(color: TmColors.ice),
				)
			],
		);
	}
}