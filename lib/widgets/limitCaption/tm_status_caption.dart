import 'package:flutter/material.dart';
import '../../tm_lib_core.dart';

class TmStatusCaption extends StatelessWidget {
  final Color color;
  final String status;

  const TmStatusCaption({
    Key? key,
    required this.color,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
        ),
        const SizedBox(width: 11),
        Text(
          status,
          style: const TextStyle(fontSize: 12, color: TmColors.textGrey),
        ),
      ],
    );
  }
}
