import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../tm_lib_core.dart';

class TmDialogModal extends StatefulWidget {
  const TmDialogModal({
    Key? key,
    required this.title,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
    required this.mainAction,
    required this.mainActionTitle,
    this.secondaryAction,
    this.secondaryActionTitle,
    this.titlePadding,
    this.insetPadding,
    this.isDismissible = false,
  }) : super(key: key);
  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final Function() mainAction;
  final String mainActionTitle;
  final Function()? secondaryAction;
  final String? secondaryActionTitle;
  final EdgeInsets? titlePadding;
  final EdgeInsets? insetPadding;
  final bool isDismissible;

  @override
  State<TmDialogModal> createState() => _TmDialogModalState();

  Future<dynamic> show({required BuildContext context}) async {
    return showDialog(context: context, barrierDismissible: isDismissible, builder: (context) => this);
  }
}

class _TmDialogModalState extends State<TmDialogModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: widget.titlePadding??EdgeInsets.zero,
            child: Center(
                child: Text(
              widget.title,
              style: widget.titleStyle ?? TmFonts.bold17.merge(const TextStyle(color: TmColors.primary)),
            )),
          ),
          if (widget.subtitle != null) ...{
            Center(
              child: Text(
                widget.subtitle!,
                style: widget.subtitleStyle ?? TmFonts.regular14.merge(const TextStyle(color: TmColors.textGrey)),
              ),
            )
          }
        ],
      ),

      titlePadding: const EdgeInsets.only(bottom: 60, top: 30),
      insetPadding: widget.insetPadding ??
          EdgeInsets.only(left: 14, right: 14, bottom: MediaQuery.of(context).size.height * 0.25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 9, left: 24, bottom: 30),
                child: TmDefaultButton(
                  onPressed: widget.mainAction,
                  title: widget.mainActionTitle,
                  textStyle: TmFonts.bold12.merge(const TextStyle(color: TmColors.primary)),
                  backgroundColor: TmColors.white,
                  borderColor: TmColors.primary,
                ),
              ),
            ),
            Expanded(
              child: widget.secondaryAction != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 9, right: 24, bottom: 30),
                      child: TmDefaultButton(
                        onPressed: widget.secondaryAction!,
                        title: widget.secondaryActionTitle ?? '',
                        textStyle: TmFonts.bold12,
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ],
    );
  }
}
