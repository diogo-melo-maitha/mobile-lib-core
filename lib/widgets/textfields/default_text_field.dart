import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../configuration/trademaster_colors.dart';
import '../../configuration/trademaster_fonts.dart';

typedef OnChanged = void Function(String value);
typedef OnSubmitted = void Function(String value);

class DefaultTextField extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final OnChanged? onChanged;
  final OnSubmitted onSubmitted;
  final double borderSize;
  final double focusedBorderSize;
  final double radius;
  final double width;
  final double height;
  final Color borderColor;
  final Color focusedBorderColor;
  final bool autoFocus;
  final bool obscure;
  final bool enabled;
  final Widget widget;
  final TextStyle? inputStyle;
  final Color? cursorColor;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;

  const DefaultTextField({
    Key? key,
    this.label = '',
    this.labelStyle,
    this.onChanged,
    required this.onSubmitted,
    this.borderSize = 1,
    this.focusedBorderSize = 2,
    this.radius = 5,
    this.width = 335,
    this.height = 60,
    this.borderColor = TrademasterColors.disabled,
    this.focusedBorderColor = TrademasterColors.primary,
    this.autoFocus = false,
    this.obscure = false,
    this.enabled = true,
    this.widget = const Text(''),
    this.inputStyle,
    this.cursorColor,
    this.focusNode,
    this.keyboardType,
    this.textEditingController,
    this.inputFormatters,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle inputTextStyle =
        TrademasterFonts.regular16.merge(const TextStyle(color: TrademasterColors.inputText));

    return Container(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            cursorColor: cursorColor,
            focusNode: focusNode,
            keyboardType: keyboardType,
            controller: textEditingController,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            autofocus: autoFocus,
            obscureText: obscure,
            enabled: enabled,
            style: inputStyle == null ? inputTextStyle : inputTextStyle.merge(inputStyle),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: borderColor,
                  width: borderSize,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: focusedBorderColor,
                  width: focusedBorderSize,
                ),
              ),
              labelStyle:
                  labelStyle == null ? TrademasterFonts.regular16 : TrademasterFonts.regular16.merge(labelStyle),
              labelText: label,
              hintText: label,
              errorText: errorText,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              suffixIcon: widget,
            ),
          ),
        ],
      ),
    );
  }
}
