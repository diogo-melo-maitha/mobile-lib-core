import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../configuration/tm_colors.dart';
import '../../configuration/tm_fonts.dart';

typedef OnChanged = void Function(String value);
typedef OnSubmitted = void Function(String value);
typedef IsTextValid = bool Function(String value);

class TmDefaultTextField extends StatefulWidget {
  final String label;
  final TextStyle? labelStyle;
  final OnChanged? onChanged;
  final OnSubmitted? onSubmitted;
  final IsTextValid? isTextValid;
  final double borderSize;
  final double focusedBorderSize;
  final double radius;
  final double horizontalSymmetricPadding;
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
  final TextInputAction textInputAction;

  const TmDefaultTextField({
    Key? key,
    this.label = '',
    this.labelStyle,
    this.onChanged,
    this.onSubmitted,
    this.isTextValid,
    this.borderSize = 1,
    this.focusedBorderSize = 2,
    this.radius = 5,
    this.horizontalSymmetricPadding = 20,
    this.borderColor = TmColors.disabled,
    this.focusedBorderColor = TmColors.primary,
    this.autoFocus = false,
    this.obscure = false,
    this.enabled = true,
    this.widget = const Text(''),
    this.inputStyle,
    this.cursorColor = TmColors.primary,
    this.focusNode,
    this.keyboardType,
    this.textEditingController,
    this.inputFormatters,
    this.errorText,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  _TmDefaultTextFieldState createState() => _TmDefaultTextFieldState();
}

class _TmDefaultTextFieldState extends State<TmDefaultTextField> {
  final FocusNode _focus = FocusNode();
  final TextStyle inputTextStyle = TmFonts.regular16.merge(const TextStyle(color: TmColors.inputText));
  final TextStyle labelTextStyle = TmFonts.regular16.merge(const TextStyle(color: TmColors.primary));
  late TextStyle? mLabelStyle =
      widget.labelStyle ?? TmFonts.regular16.merge(const TextStyle(color: TmColors.textOnSurface));

  String? mErrorText;
  late TextEditingController mTextEditingController = widget.textEditingController ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    configureFocusNode();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalSymmetricPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            textInputAction: widget.textInputAction,
            cursorColor: widget.cursorColor,
            focusNode: widget.focusNode ?? _focus,
            keyboardType: widget.keyboardType,
            controller: mTextEditingController,
            inputFormatters: widget.inputFormatters,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            autofocus: widget.autoFocus,
            obscureText: widget.obscure,
            enabled: widget.enabled,
            style: widget.inputStyle == null ? inputTextStyle : inputTextStyle.merge(widget.inputStyle),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  color: widget.borderColor,
                  width: widget.borderSize,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  color: widget.focusedBorderColor,
                  width: widget.focusedBorderSize,
                ),
              ),
              labelStyle: mLabelStyle,
              labelText: widget.label,
              errorText: mErrorText,
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: const BorderSide(
                  color: TmColors.error,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: const BorderSide(
                  color: TmColors.error,
                ),
              ),
              suffixIcon: widget.widget,
            ),
          ),
        ],
      ),
    );
  }

  void configureFocusNode() {
    _focus.addListener(() {
      setState(() {
        if (!_focus.hasFocus) {
          if (widget.isTextValid != null && !widget.isTextValid!(mTextEditingController.text)) {
            mErrorText = widget.errorText;
            mLabelStyle = labelTextStyle.merge(const TextStyle(color: TmColors.error));
          } else if (mTextEditingController.text.isEmpty) {
            mErrorText = null;
            mLabelStyle = TmFonts.regular16.merge(const TextStyle(color: TmColors.textOnSurface));
          }
        } else {
          mErrorText = null;
          mLabelStyle = labelTextStyle;
        }
      });
    });
  }
}