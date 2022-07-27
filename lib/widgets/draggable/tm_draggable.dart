import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../tm_lib_core.dart';

class TmDraggable extends StatefulWidget {
	static const Key gestureDetectorKey = Key('gestureDetectorKey');

	final List<Widget> children;
	final double? minHeight;
	final double? maxHeight;
	final Function()? onClose;
	final MainAxisAlignment mainAxisAlignment;
	final String? title;
	final bool showCloseButton;

	const TmDraggable({
		required this.children,
		this.maxHeight,
		this.minHeight,
		this.onClose,
		this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
		this.title,
		this.showCloseButton = true,
		Key? key
	}) : super(key: key);

	@override
	State<TmDraggable> createState() => _TmDraggableState();
}

class _TmDraggableState extends State<TmDraggable> {
	@override
	Widget build(BuildContext context) {
		return Material(
			color: Colors.transparent,
		  child: Column(
		    children: [
					Expanded(
		  			child: GestureDetector(
							key: TmDraggable.gestureDetectorKey,
		  				onTap: _onClose,
		  			)
		  		),
		      SlidingUpPanel(
						maxHeight: mMaxHeight,
		      	minHeight: mMinHeight,
		      	onPanelClosed: _onClose,
		      	borderRadius: const BorderRadius.only(
							topLeft: Radius.circular(15),
							topRight: Radius.circular(15)
						),
		      	panel: Container(
		      		margin: const EdgeInsets.symmetric(horizontal: 24),
		      		child: SingleChildScrollView(
		      			child: ConstrainedBox(
		      				constraints: BoxConstraints(
		      					minHeight: mMinHeight,
		      					maxHeight: mMaxHeight
		      				),
		      				child: IntrinsicHeight(
		      					child: Column(
		      						children: [
		      							Column(
		      								crossAxisAlignment: CrossAxisAlignment.start,
		      								children: [
		      									Center(
		      										child: Container(
		      											margin: const EdgeInsets.only(top: 8.5),
		      											width: 36,
		      											height: 5,
		      											decoration: BoxDecoration(
		      												color: TmColors.lightGrey,
		      												borderRadius: BorderRadius.circular(5)
		      											)
		      										),
		      									),
		      									Row(
		      										mainAxisAlignment: MainAxisAlignment.spaceBetween,
		      										children: [
		      											Container(
		      												width: size.width * 0.7,
		      												alignment: Alignment.center,
		      												child: Padding(
		      													padding: EdgeInsets.only(top: 15.5, left: size.width * 0.182),
		      													child: Text(
		      														mTitle,
		      														style: TmFonts.bold14.merge(const TextStyle(color: TmColors.lightGrey)),
		      													),
		      												),
		      											),
																if (widget.showCloseButton)
																	IconButton(
																		onPressed: _onClose,
																		icon: const Icon(
																			Icons.cancel,
																			color: TmColors.lightGrey,
																			size: 30,
																		)
																	)
																else
																	Container()
		      										]
		      									),
		      								]
		      							),
												Expanded(
													child: Column(
														mainAxisAlignment: widget.mainAxisAlignment,
														children: widget.children
													)
												)
		      						],
		      					),
		      				),
		      			),
		      		),
		      	),
		      ),
		    ],
		  ),
		);
	}

	late Size size = MediaQuery.of(context).size;
	late double mMaxHeight = widget.maxHeight ?? size.height * 0.9;
	late double mMinHeight = widget.minHeight ?? size.height * 0.9;
	late String mTitle = widget.title ?? 'Filtrar';

	void _onClose() {
		if (widget.onClose != null) {
			widget.onClose!();
		}
		Navigator.pop(context);
	}
}