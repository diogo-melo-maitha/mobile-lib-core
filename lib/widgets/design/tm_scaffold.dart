import 'package:flutter/material.dart';
import '../../configuration/tm_colors.dart';

class TmScaffold extends StatelessWidget {
  final Widget body;
	final Color backgroundColor;

  const TmScaffold({
    Key? key,
    required this.body,
		this.backgroundColor = TmColors.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: body,
    );
  }
}
