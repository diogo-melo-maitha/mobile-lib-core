import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../configuration/trademaster_colors.dart';

class DefaultButton extends StatelessWidget {
  final bool disabled;
  final String title;
  final Color titleColor;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color disabledColor;
  final Color? borderColor;
  final double borderSize;
  final VoidCallback onPressed;
  final double radius;
  final double elevation;

  const DefaultButton({
    Key? key,
    this.disabled = false,
    this.width = 335.0,
    this.height = 54.0,
    this.backgroundColor = TrademasterColors.primary,
    this.disabledColor = TrademasterColors.primaryDisabled,
    this.radius = 50.0,
    this.borderColor,
    this.borderSize = 1.0,
    required this.onPressed,
    required this.title,
    this.titleColor = TrademasterColors.white,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      key: const Key('absorbkey'),
      absorbing: disabled,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(radius),
        child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: disabled == false ? backgroundColor : disabledColor,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
                color: borderColor ?? (disabled == false ? backgroundColor : disabledColor), width: borderSize),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: elevation,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: titleColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}