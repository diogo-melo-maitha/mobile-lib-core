import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TrademasterDetailedScaffold extends StatelessWidget {
  final Widget body;

  const TrademasterDetailedScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/line_bot.svg',
            package: 'tm_lib_core',
            alignment: Alignment.bottomRight,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          SvgPicture.asset(
            'assets/images/line_top.svg',
            package: 'tm_lib_core',
            alignment: Alignment.topRight,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          body,
        ],
      ),
    );
  }
}
