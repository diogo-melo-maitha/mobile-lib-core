import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../tm_lib_core.dart';

typedef OnChangeEnd = void Function(double value);
typedef OnChangeTextField = void Function(String? value);

class TmPercentageSlider extends StatefulWidget {
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
  final TextEditingController textEditingController;
  final OnChangeTextField onChangedTextField;

  const TmPercentageSlider({
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
    required this.textEditingController,
    required this.onChangedTextField,
  }) : super(key: key);

  @override
  _TmPercentageSliderState createState() => _TmPercentageSliderState();
}

class _TmPercentageSliderState extends State<TmPercentageSlider> {
  final FocusNode _focus = FocusNode();
  TextEditingController percentageController = TextEditingController();
  TextStyle percentageFontStyle = TmFonts.regular48.merge(const TextStyle(color: TmColors.primary));

  TextStyle textFontStyle = TmFonts.regular12.merge(const TextStyle(color: TmColors.textOnSurface));

  int sliderValue = 100;

  @override
  void initState() {
    super.initState();
    sliderValue = widget.initialValue.round();
    widget.textEditingController.text = widget.initialValue.round().toString();
  }

  void onPressedMinus() {
    setState(() {
      sliderValue >= 25 ? sliderValue = sliderValue - 25 : sliderValue = 0;
    });
    widget.sliderCallback(sliderValue.roundToDouble());
  }

  void onPressedPlus() {
    setState(() {
      sliderValue <= 75 ? sliderValue = sliderValue + 25 : sliderValue = 100;
    });
    widget.sliderCallback(sliderValue.roundToDouble());
  }

  void onChanged(double value) {
    setState(() {
      sliderValue = value.round();
    });
    widget.sliderCallback(sliderValue.roundToDouble());
  }

  void onChangedTextField(String? value) {
    setState(() {
      if (int.parse(value!) < 0) {
        sliderValue = 0;
        widget.textEditingController.text = '0';
        _focus.unfocus();
      } else if (int.parse(value) > 100) {
        sliderValue = 100;
        widget.textEditingController.text = '100';
        _focus.unfocus();
      } else {
        sliderValue = int.parse(value);
      }
    });
    widget.onChangedTextField(sliderValue.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: TmPercentageSlider.widgetPaddingKey,
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
                      key: TmPercentageSlider.minusButtonKey,
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
                  Expanded(
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]+|\s')),
                      ],
                      keyboardType: TextInputType.number,
                      focusNode: _focus,
                      textAlign: TextAlign.center,
                      style: widget.numberStyle == null
                          ? percentageFontStyle
                          : percentageFontStyle.merge(widget.numberStyle),
                      controller: widget.textEditingController,
                      onChanged: (value) {
                        if (value == '') {
                          onChangedTextField('0');
                        } else {
                          onChangedTextField(value);
                        }
                      },
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      key: TmPercentageSlider.plusButtonKey,
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
              key: TmPercentageSlider.titlePaddingKey,
              padding: const EdgeInsets.only(left: 80, right: 80),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    widget.title,
                    key: TmPercentageSlider.titleTextKey,
                    style: widget.titleTextStyle == null ? textFontStyle : textFontStyle.merge(widget.titleTextStyle),
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            ),
            Padding(
              key: TmPercentageSlider.sliderPaddingKey,
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
                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 13.5),
                          thumbShape:
                              const RoundSliderThumbShape(enabledThumbRadius: 12, pressedElevation: 2, elevation: 2),
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
              key: TmPercentageSlider.subtitlePaddingKey,
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    widget.subTitle,
                    key: TmPercentageSlider.subtitleTextKey,
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
