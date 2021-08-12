import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configuration/tm_colors.dart';
import '../../configuration/tm_fonts.dart';

const Color timerBackgroundColor = Color(0xffF4F4F4);

class TmDefaultTimer extends StatefulWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color? borderColor;
  final double borderSize;
  final double radius;
  final VoidCallback timeCallback;
  final int time;
  final int timeLimit;
  final TextStyle? textStyle;

  const TmDefaultTimer({
    Key? key,
    this.width = 70,
    this.height = 40,
    this.backgroundColor = timerBackgroundColor,
    this.borderColor,
    this.borderSize = 0,
    this.radius = 5,
    required this.timeCallback,
    required this.time,
    this.timeLimit = 0,
    this.textStyle,
  }) : super(key: key);

  @override
  _TmDefaultTimerState createState() => _TmDefaultTimerState();
}

class _TmDefaultTimerState extends State<TmDefaultTimer> {
  int _mTime = 30;
  Timer? _timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    _mTime = widget.time;
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_mTime >= 1) {
            _mTime--;
          } else {
            _timer!.cancel();
            widget.timeCallback();
          }
        });
      }
      else{
        _timer!.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle fontStyleText = TmFonts.bold14.merge(const TextStyle(color: TmColors.textOnSurface));

    // _startTimer.call();

    return InkWell(
      onTap: _startTimer,
      child: Container(
        // height: height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(color: widget.borderColor ?? widget.backgroundColor, width: widget.borderSize),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '$_mTime s',
                style: widget.textStyle == null ? fontStyleText : fontStyleText.merge(widget.textStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
