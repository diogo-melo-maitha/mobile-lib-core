import 'package:flutter/material.dart';
import '../../extensions/tm_double_extension.dart';
import '../../tm_lib_core.dart';

class TmLimitVisualizationCard extends StatefulWidget {
	final Widget arrangementIcon;
	final Function() onTap;
	final double takenLimit;
	final double availableLimit;
	final double elevation;
	final Color takenLimitBarColor;
	final Color availableLimitBarColor;
	final Color limitTextColor;
	final Color labelTextColor;

	const TmLimitVisualizationCard({
		required this.arrangementIcon,
		required this.availableLimit,
		required this.onTap,
		required this.takenLimit,
		required this.elevation,
		this.takenLimitBarColor = TmColors.cascade,
		this.availableLimitBarColor = TmColors.genoa,
		this.limitTextColor = TmColors.primary,
		this.labelTextColor = TmColors.darkGrey2,
		Key? key
	}) : super(key: key);

	@override
	_TmLimitVisualizationCardState createState() => _TmLimitVisualizationCardState();
}

class _TmLimitVisualizationCardState extends State<TmLimitVisualizationCard> {	
	@override
	Widget build(BuildContext context) {
		final size = MediaQuery.of(context).size;
		final defaultWidth = size.width * 0.94;
		final cardBorderRadius = BorderRadius.circular(5);
		final progressBarBorderRadius = BorderRadius.circular(100);
		final progressBarWidth = defaultWidth - 40;

		return Container(
			margin: const EdgeInsets.only(top: 12),
		  child: Material(
		  	color: TmColors.white,
		  	elevation: widget.elevation,
		  	borderRadius: cardBorderRadius,
		    child: InkWell(
		  		onTap: widget.onTap,
		  		borderRadius: cardBorderRadius,
		      child: Container(
		      	width: defaultWidth,
		  			padding: const EdgeInsets.all(20),
		  			child: Column(
		  				children: [
		  					Row(
		  						mainAxisAlignment: MainAxisAlignment.spaceBetween,
		  						children: [
		  							Container(
		  								child: widget.arrangementIcon,
		  							),
		  							Container(
		  								width: 22,
		  								height: 22,
		  								decoration: BoxDecoration(
		  									borderRadius: BorderRadius.circular(22),
		  									border: Border.all(color: TmColors.cascade)
		  								),
		  								child: const Icon(
		  									Icons.arrow_forward_ios_sharp,
		  									size: 14,
		  									color: TmColors.cascade
		  								),
		  							)
		  						],
		  					),
		  					const SizedBox(height: 10),
		  					Padding(
		  					  padding: const EdgeInsets.symmetric(horizontal: 2),
		  					  child: Row(
		  					  	mainAxisAlignment: MainAxisAlignment.spaceBetween,
		  					  	children: [
		  					  		Text(
		  					  			'R\$${widget.takenLimit.toCurrency()}',
		  					  			style: TmFonts.semiBold16.merge(
		  					  				TextStyle(color: widget.limitTextColor),
		  					  			),
		  					  		),
		  					  		Text(
		  					  			'R\$${widget.availableLimit.toCurrency()}',
		  					  			style: TmFonts.semiBold16.merge(
		  					  				TextStyle(color: widget.limitTextColor),
		  					  			),
		  					  		)
		  					  	],
		  					  ),
		  					),
		  					const SizedBox(height: 3),
		  					Container(
		  						alignment: Alignment.centerLeft,
		  						width: progressBarWidth,
		  						height: 9,
		  						decoration: BoxDecoration(
		  							borderRadius: progressBarBorderRadius,
		  							color: widget.takenLimitBarColor
		  						),
		  						child: Container(
		  							width: progressBarWidth * (widget.takenLimit / (widget.takenLimit + widget.availableLimit)),
		  							height: 9,
		  							decoration: BoxDecoration(
		  								borderRadius: progressBarBorderRadius,
		  								color: widget.availableLimitBarColor 
		  							),
		  						),
		  					),
		  					const SizedBox(height: 5),
		  					Row(
		  						mainAxisAlignment: MainAxisAlignment.spaceBetween,
		  						children: [
		  							Text(
		  								'Limite utilizado',
		  								style: TextStyle(
		  									color: widget.labelTextColor,
		  									fontSize: 10
		  								),
		  							),
		  							Text(
		  								'Limite disponível',
		  								style: TextStyle(
		  									color: widget.labelTextColor,
		  									fontSize: 10
		  								),
		  							)
		  						],
		  					)
		  				],
		  			),
		      ),
		    ),
		  ),
		);
	}
}