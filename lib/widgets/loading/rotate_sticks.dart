import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class RotateSticks extends StatefulWidget {
  const RotateSticks({
    Key? key,
    this.size = 40.0,
    this.duration = const Duration(seconds: 3),
    this.controller,
  }) : super(key: key);

  final double size;
  final Duration duration;
  final AnimationController? controller;

  @override
  _RotateSticksState createState() => _RotateSticksState();
}

class _RotateSticksState extends State<RotateSticks> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: RotationTransition(
                turns: Tween(begin: 0.1, end: 1.1).animate(_controller),
                child: SvgPicture.asset(
                  'assets/images/loading.svg',
                  package: 'tm_lib_core',
                  width: widget.size,
                ),
              ),
            ),
          // }),
        // ),
      // ),
    );
  }
}
