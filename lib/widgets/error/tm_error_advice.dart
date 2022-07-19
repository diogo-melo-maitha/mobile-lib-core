import 'package:flutter/material.dart';

import '../../tm_lib_core.dart';

class TmErrorAdvice extends StatelessWidget {
  static const Key descriptionKey = Key('descriptionKey');

  final IconData icon;
  final String description;
  final String buttontitle;
  final VoidCallback action;

  const TmErrorAdvice({
    Key? key,
    required this.icon,
    required this.description,
    required this.buttontitle,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(
            description,
            key: TmErrorAdvice.descriptionKey,
            style: TmFonts.semiBold17,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TmDefaultButton(onPressed: action, title: buttontitle),
        )
      ],
    );
  }
}
