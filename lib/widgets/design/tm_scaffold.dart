import 'package:flutter/material.dart';
import '../../configuration/tm_colors.dart';

class TmScaffold extends StatelessWidget {
  final Widget body;

  const TmScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TmColors.white,
      body: body,
    );
  }
}
