import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../configuration/tm_colors.dart';
import '../../configuration/tm_fonts.dart';
import '../../utils/function_type_utils.dart';

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
  final Widget? widget;
  final TextStyle? inputStyle;
  final Color? cursorColor;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final TextInputAction textInputAction;
  final TextCapitalization? textCapitalization;
  final Function()? onErrorClick;
  final TextDecoration? textDecoration;
  final bool? showError;
  final String? clickableError;
  final VoidCallback? onTap;
  final int? maxLines;
  final int? minLines;
  final double errorTopPadding;

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
    this.focusedBorderColor = TmColors.disabled,
    this.autoFocus = false,
    this.obscure = false,
    this.enabled = true,
    this.widget,
    this.inputStyle,
    this.cursorColor = TmColors.primary,
    this.focusNode,
    this.keyboardType,
    this.textEditingController,
    this.inputFormatters,
    this.errorText,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization,
    this.onErrorClick,
    this.textDecoration,
    this.showError,
    this.clickableError,
    this.onTap,
    this.maxLines = 1,
    this.minLines,
    this.errorTopPadding = 4,
  }) : super(key: key);

  @override
  _TmDefaultTextFieldState createState() => _TmDefaultTextFieldState();
}

class _TmDefaultTextFieldState extends State<TmDefaultTextField> {
  final FocusNode _focus = FocusNode();
  final TextStyle inputTextStyle = TmFonts.regular16.merge(const TextStyle(color: TmColors.inputText));
  final TextStyle labelTextStyle = TmFonts.regular16.merge(const TextStyle(color: TmColors.primary));
  final TextStyle errorStyle = TmFonts.regular12.merge(const TextStyle(color: TmColors.error));
  late TextStyle? mLabelStyle =
      widget.labelStyle ?? TmFonts.regular16.merge(const TextStyle(color: TmColors.textOnSurface));
  Color? mFocusedBorderColor;
  Color? mBorderColor;

  String? errorText;
  String? mErrorText;

  late TextEditingController mTextEditingController = widget.textEditingController ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    configureShowError();
    configureFocusNode();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalSymmetricPadding),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          TextField(
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            textInputAction: widget.textInputAction,
            textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
            onTap: widget.onTap,
            cursorColor: widget.cursorColor,
            focusNode: widget.focusNode ?? _focus,
            keyboardType: widget.keyboardType,
            controller: mTextEditingController,
            inputFormatters: widget.inputFormatters,
            onChanged: onChanged,
            onSubmitted: widget.onSubmitted,
            autofocus: widget.autoFocus,
            obscureText: widget.obscure,
            enabled: widget.enabled,
            style: widget.enabled == false
                ? inputTextStyle.merge(const TextStyle(color: TmColors.textOnSurface))
                : widget.inputStyle == null
                    ? inputTextStyle
                    : inputTextStyle.merge(widget.inputStyle),
            decoration: InputDecoration(
              errorText: mErrorText != null ? '' : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  color: mTextEditingController.text.isNotEmpty ? TmColors.primary : widget.borderColor,
                  width: mTextEditingController.text.isNotEmpty ? 2 : widget.borderSize,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  color: mTextEditingController.text.isNotEmpty ? TmColors.primary : widget.focusedBorderColor,
                  width: widget.focusedBorderSize,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  color: widget.borderColor,
                  width: widget.borderSize,
                ),
              ),
              labelStyle: mLabelStyle,
              labelText: widget.label,
              alignLabelWithHint: true,
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
          if (mErrorText != null)
            Positioned(
              top: 63,
              left: -2,
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 12, top: widget.errorTopPadding),
                child: RichText(
                  text: TextSpan(
                    text: mErrorText != null ? mErrorText! : '',
                    style: errorStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.clickableError,
                        style: errorStyle.merge(const TextStyle(decoration: TextDecoration.underline)),
                        recognizer: TapGestureRecognizer()..onTap = widget.onErrorClick,
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            Container()
        ],
      ),
    );
  }

  void onChanged(String value) {
    configureFocusedBorderColor();
    widget.onChanged!(value);
  }

  void configureFocusedBorderColor() {
    setState(() {
      if (mTextEditingController.text.isNotEmpty) {
        mFocusedBorderColor = TmColors.primary;
      } else {
        mFocusedBorderColor = widget.focusedBorderColor;
      }
    });
  }

  void configureFocusNode() {
    _focus.addListener(() => onFocusInput(false));
    widget.focusNode?.addListener(() => onFocusInput(true));
  }

  void onFocusInput(bool useWidgetFocus) {
    setState(() {
      if ((!useWidgetFocus && !_focus.hasFocus) ||
          (useWidgetFocus && widget.focusNode != null && !widget.focusNode!.hasFocus)) {
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
  }

  void configureShowError() {
    if (mErrorText != null) {
      errorText = '';
      mErrorText = widget.errorText;
      mLabelStyle = labelTextStyle.merge(const TextStyle(color: TmColors.error));
    } else if (widget.showError == false) {
      errorText = null;
      mErrorText = null;
      _focus.hasFocus
          ? mLabelStyle = labelTextStyle
          : TmFonts.regular16.merge(const TextStyle(color: TmColors.textOnSurface));
    } else if (widget.showError == true) {
      errorText = '';
      mErrorText = widget.errorText;
      mLabelStyle = labelTextStyle.merge(const TextStyle(color: TmColors.error));
    }
  }
}
