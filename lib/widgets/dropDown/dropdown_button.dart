import 'package:flutter/material.dart';

import '../../configuration/tm_colors.dart';
import '../../configuration/tm_fonts.dart';
import '../../utils/function_type_utils.dart';
import '../textfields/tm_default_text_field.dart';

class TmDropdownButton extends StatefulWidget {
  final String label;
  final TextStyle? labelStyle;
  final OnChanged onChanged;
  final double borderSize;
  final double horizontalSymmetricPadding;
  final Color borderColor;
  final TextStyle? textStyle;
  final List list;
  final int initialValueIndex;
  final double menuMaxHeight;
  final String? updateValue;
  final bool disabled;

  const TmDropdownButton({
    Key? key,
    required this.label,
    this.labelStyle = const TextStyle(color: TmColors.primary),
    required this.onChanged,
    this.borderSize = 2,
    this.horizontalSymmetricPadding = 20,
    this.borderColor = TmColors.primary,
    this.textStyle,
    this.initialValueIndex = 0,
    required this.list,
    this.menuMaxHeight = double.infinity,
    this.updateValue,
    this.disabled = false,
  }) : super(key: key);

  @override
  _TmDropdownButtonState createState() => _TmDropdownButtonState();
}

class _TmDropdownButtonState extends State<TmDropdownButton> {
  TextStyle dropDownTextStyle = TmFonts.regular16.merge(const TextStyle(color: Color(0xff383A3C)));
  TextEditingController dropdownController = TextEditingController();
  late String? hint = widget.label;

  @override
  Widget build(BuildContext context) {
    dropdownController.text = ' ';
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _updateValue();
    });
    return Stack(
      children: [
        TmDefaultTextField(
          enabled: false,
          horizontalSymmetricPadding: widget.horizontalSymmetricPadding,
          label: widget.label,
          borderColor: widget.borderColor,
          borderSize: widget.borderSize,
          labelStyle: widget.labelStyle,
          textEditingController: dropdownController,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.horizontalSymmetricPadding),
          child: Container(
            height: 60,
            width: double.infinity,
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: AbsorbPointer(
                  absorbing: widget.disabled,
                  child: DropdownButton<String>(
                    menuMaxHeight: widget.menuMaxHeight,
                    isExpanded: true,
                    isDense: true,
                    icon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Icons.keyboard_arrow_down),
                    ),
                    iconDisabledColor: widget.borderColor,
                    iconEnabledColor: widget.borderColor,
                    style: widget.textStyle != null ? TmFonts.regular16.merge(widget.textStyle) : dropDownTextStyle,
                    hint: Text(hint ?? ''),
                    onChanged: (value) {
                      widget.onChanged(value!);
                      return setState(() {
                        hint = value;
                      });
                    },
                    items: widget.list.map((valueItem) {
                      return DropdownMenuItem<String>(
                        value: valueItem,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(valueItem),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _updateValue() {
    if (widget.updateValue != null) {
      setState(() {
        hint = widget.updateValue;
      });
    }
  }
}
