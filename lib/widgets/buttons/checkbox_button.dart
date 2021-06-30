import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../configuration/trademaster_colors.dart';

typedef CheckboxCallback = void Function(bool? value);

class CheckboxButton extends StatelessWidget {
  final bool checked;
  final CheckboxCallback checkboxCallback;
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final Color primaryColor;
  final VoidCallback onPressed;
  final Color borderColor;

  const CheckboxButton({
    Key? key,
    this.checked = false,
    required this.checkboxCallback,
    required this.title,
    this.titleColor = Colors.black,
    this.backgroundColor = TrademasterColors.white,
    this.primaryColor = TrademasterColors.checkBoxPrimary,
    required this.onPressed,
    this.borderColor = TrademasterColors.checkBoxBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        width: 345,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
            )),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Theme(
                data: ThemeData(unselectedWidgetColor: primaryColor),
                child: Checkbox(
                  value: checked,
                  onChanged: checkboxCallback,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: titleColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 17.19),
              child: FaIcon(
                FontAwesomeIcons.chevronRight,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
