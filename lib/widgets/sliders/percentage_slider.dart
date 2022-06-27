import 'package:flutter/material.dart';

import '../../tm_lib_core.dart';

typedef OnChangeEnd = void Function(double value);

class PercentageSlider extends StatefulWidget {
  static const Key widgetPaddingKey = Key('widgetPaddingKey');
  static const Key titlePaddingKey = Key('titlePaddingKey');
  static const Key subtitlePaddingKey = Key('subtitlePaddingKey');
  static const Key titleTextKey = Key('titleTextKey');
  static const Key subtitleTextKey = Key('subtitleTextKey');
  static const Key numberTextKey = Key('numberTextKey');
  static const Key minusButtonKey = Key('minusButtonKey');
  static const Key plusButtonKey = Key('plusButtonKey');
  static const Key sliderPaddingKey = Key('sliderPaddingKey');

  final double initialValue;
  final double min;
  final double max;
  final Color sliderActiveColor;
  final Color sliderInactiveColor;
  final OnChangeEnd sliderCallback;
  final String title;
  final String subTitle;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? numberStyle;
  final double iconSize;
  final Color iconColor;

  const PercentageSlider({
    Key? key,
    this.initialValue = 100,
    this.min = 0,
    this.max = 100,
    this.title = '',
    this.subTitle = '',
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.numberStyle,
    this.iconSize = 36,
    this.iconColor = TmColors.disabledText,
    this.sliderActiveColor = TmColors.disabledText,
    this.sliderInactiveColor = const Color(0xffF2F2F2),
    required this.sliderCallback,
  }) : super(key: key);

  @override
  _PercentageSliderState createState() => _PercentageSliderState();
}

class _PercentageSliderState extends State<PercentageSlider> {
  TextStyle percentageFontStyle = TmFonts.regular48
      .merge(const TextStyle(color: TmColors.primary));

  TextStyle textFontStyle = TmFonts.regular12
      .merge(const TextStyle(color: TmColors.textOnSurface));

  int sliderValue = 100;

  @override
  void initState() {
    super.initState();
    sliderValue = widget.initialValue.round();
  }

  void onPressedMinus() {
    setState(() {
      sliderValue >= 10 ? sliderValue = sliderValue - 10 : sliderValue = 0;
    });
    widget.sliderCallback(sliderValue.roundToDouble());
  }

  void onPressedPlus() {
    setState(() {
      sliderValue <= 90 ? sliderValue = sliderValue + 10 : sliderValue = 100;
    });
    widget.sliderCallback(sliderValue.roundToDouble());
  }

  void onChanged(double value) {
    setState(() {
      sliderValue = value.round();
    });
    widget.sliderCallback(sliderValue.roundToDouble());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: PercentageSlider.widgetPaddingKey,
      padding: const EdgeInsets.only(
        left: 26,
        right: 26,
      ),
      child: SizedBox(
        width: 323,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      key: PercentageSlider.minusButtonKey,
                      splashRadius: 0.1,
                      iconSize: widget.iconSize,
                      onPressed: onPressedMinus,
                      icon: Container(
                        width: widget.iconSize,
                        height: widget.iconSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: widget.iconColor,
                        ),
                        child: const Center(
                          child: Text(
                            '-',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      )),
                  Text(
                    '$sliderValue' '%',
                    key: PercentageSlider.numberTextKey,
                    style: widget.numberStyle == null
                        ? percentageFontStyle
                        : percentageFontStyle.merge(widget.numberStyle),
                  ),
                  IconButton(
                      key: PercentageSlider.plusButtonKey,
                      splashRadius: 0.1,
                      iconSize: widget.iconSize,
                      onPressed: onPressedPlus,
                      icon: Container(
                        width: widget.iconSize,
                        height: widget.iconSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: widget.iconColor,
                        ),
                        child: const Center(
                          child: Text(
                            '+',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              key: PercentageSlider.titlePaddingKey,
              padding: const EdgeInsets.only(left: 80, right: 80),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    widget.title,
                    key: PercentageSlider.titleTextKey,
                    style: widget.titleTextStyle == null
                        ? textFontStyle
                        : textFontStyle.merge(widget.titleTextStyle),
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            ),
            Padding(
              key: PercentageSlider.sliderPaddingKey,
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(children: [
                      Positioned(
                        bottom: 1,
                        top: 1,
                        left: 7,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: widget.sliderActiveColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        top: 1,
                        right: 7,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: widget.sliderInactiveColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          overlayColor: Colors.black12,
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 13.5),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 12,
                              pressedElevation: 2,
                              elevation: 2),
                          thumbColor: widget.sliderActiveColor,
                          activeTrackColor: widget.sliderActiveColor,
                          inactiveTrackColor: widget.sliderInactiveColor,
                        ),
                        child: Slider(
                          value: sliderValue.roundToDouble(),
                          onChanged: onChanged,
                          min: widget.min,
                          max: widget.max,
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
            Padding(
              key: PercentageSlider.subtitlePaddingKey,
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    widget.subTitle,
                    key: PercentageSlider.subtitleTextKey,
                    style: widget.subtitleTextStyle == null
                        ? textFontStyle
                        : textFontStyle.merge(widget.subtitleTextStyle),
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
