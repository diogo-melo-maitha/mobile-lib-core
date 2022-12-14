import 'package:flutter/cupertino.dart';

import '../../tm_lib_core.dart';

class TmFilterPeriod extends StatefulWidget {
	final TextEditingController dayController;
	final TextEditingController monthController;
	final TextEditingController yearController;
	final Function(DateTime) onChange;
	final DateTime startDate;
	final DateTime? maxDate;
	final DateTime? minDate;
	final double? height;

	const TmFilterPeriod({
		required this.dayController,
		required this.monthController,
		required this.yearController,
		required this.onChange,
		required this.startDate,
		this.maxDate,
		this.minDate,
		this.height,
		Key? key
	}) : super(key: key);

	@override
	State<TmFilterPeriod> createState() => _TmFilterPeriodState();
}

class _TmFilterPeriodState extends State<TmFilterPeriod> {
	late Size size = MediaQuery.of(context).size;

	void _showDatePickerDialog(Function(DateTime) onChange, DateTime startDate) {
    showCupertinoModalPopup<void>(
			context: context,
			builder: (context) => Container(
				height: 216,
				padding: const EdgeInsets.only(top: 6),
				margin: EdgeInsets.only(
					bottom: MediaQuery.of(context).viewInsets.bottom,
				),
				color: CupertinoColors.systemBackground.resolveFrom(context),
				child: SafeArea(
					top: false,
					child: CupertinoDatePicker(
						initialDateTime: startDate,
						mode: CupertinoDatePickerMode.date,
						use24hFormat: true,
						dateOrder: DatePickerDateOrder.dmy,
						onDateTimeChanged: onChange,
						maximumDate: widget.maxDate,
						minimumDate: widget.minDate
					)
				),
			));
  }
	
	@override
	Widget build(BuildContext context) {
		return SizedBox(
			height: widget.height,
		  child: GestureDetector(
		  	key: widget.key,
		  	onTap: () {
		  		_showDatePickerDialog(
		  			widget.onChange,
		  			widget.startDate
		  		);
		  	},
		  	child: AbsorbPointer(
		  		child: Row(
		  			mainAxisAlignment: MainAxisAlignment.spaceBetween,
		  			children: [
		  				Container(
		  					width: size.width * 0.2,
		  					child: TmDefaultTextField(
		  						textEditingController: widget.dayController,
		  						horizontalSymmetricPadding: 0,
		  						borderColor: TmColors.primary
		  					)
		  				),
		  				Container(
		  					width: size.width * 0.4,
		  					child: TmDefaultTextField(
		  						textEditingController: widget.monthController,
		  						horizontalSymmetricPadding: 0,
		  						borderColor: TmColors.primary
		  					)
		  				),
		  				Container(
		  					width: size.width * 0.2,
		  					child: TmDefaultTextField(
		  						textEditingController: widget.yearController,
		  						horizontalSymmetricPadding: 0,
		  						borderColor: TmColors.primary
		  					)
		  				)
		  			],
		  		),
		  	),
		  ),
		);
	}
}