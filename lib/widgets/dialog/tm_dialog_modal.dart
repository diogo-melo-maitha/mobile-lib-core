import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../tm_lib_core.dart';

class TmDialogModal extends StatefulWidget {
  const TmDialogModal({
    Key? key,
    required this.title,
    this.subtitle,
    required this.mainAction,
    required this.mainActionTitle,
    this.secondaryAction,
    this.secondaryActionTitle,
    this.titlePadding,
    this.insetPadding,
    this.isDismissible = false,
  }) : super(key: key);
  final String title;
  final String? subtitle;
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
      title: Padding(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                widget.title,
                style: TmFonts.semiBold24.merge(const TextStyle(color: TmColors.textBlack)),
              ),
            ),
            if (widget.subtitle != null) ...{
              Center(
                child: Text(
                  widget.subtitle!,
                  style: TmFonts.regular14.merge(const TextStyle(color: TmColors.textGrey)),
                ),
              )
            }
          ],
        ),
      ),
      titlePadding: widget.titlePadding ?? const EdgeInsets.only(bottom: 60, top: 30),
      insetPadding: widget.insetPadding ??
          EdgeInsets.only(left: 14, right: 14, bottom: MediaQuery.of(context).size.height * 0.25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [
        Container(
          width: double.infinity,
          child: IntrinsicWidth(
            child: Column(
              children: [
                const Divider(color: TmColors.lineGrey, indent: 0, endIndent: 0),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: widget.secondaryAction != null
                            ? TmTextButton(
                                onPressed: widget.secondaryAction!,
                                title: widget.secondaryActionTitle ?? '',
                                textStyle: TmFonts.semiBold16.merge(const TextStyle(color: TmColors.accentLight)),
                              )
                            : Container(),
                      ),
                      const VerticalDivider(
                        color: TmColors.lineGrey,
                        indent: 0,
                        endIndent: 0,
                        width: 2,
                      ),
                      Expanded(
                        child: TmTextButton(
                          onPressed: () {
                            widget.mainAction();
                            Modular.to.pop();
                          },
                          title: widget.mainActionTitle,
                          textStyle: TmFonts.semiBold16.merge(const TextStyle(color: TmColors.accentLight)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
