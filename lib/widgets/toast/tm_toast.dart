import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../configuration/tm_colors.dart';
import '../../configuration/tm_fonts.dart';

class TmToast {
  static void showSuccess({required String title, required BuildContext context, VoidCallback? onTap}) {
    _buildFlushBar(
      icon: const FaIcon(
        FontAwesomeIcons.checkCircle,
        color: TmColors.white,
      ),
      context: context,
      title: title,
      backgroundColor: TmColors.success,
      textColor: TmColors.white,
      onTap: onTap,
    ).show(context);
  }

  static void showError({required String title, required BuildContext context, VoidCallback? onTap}) {
    _buildFlushBar(
      icon: const FaIcon(
        FontAwesomeIcons.timesCircle,
        color: TmColors.white,
      ),
      context: context,
      title: title,
      backgroundColor: TmColors.error,
      textColor: TmColors.white,
      onTap: onTap,
    ).show(context);
  }

  static void showWarning({required String title, required BuildContext context, VoidCallback? onTap}) {
    _buildFlushBar(
      icon: SvgPicture.asset(
        'assets/images/exclamation_outlined.svg',
        package: 'tm_lib_core',
      ),
      context: context,
      title: title,
      backgroundColor: const Color(0xffFFDE84),
      textColor: const Color(0xff0B5964),
      onTap: onTap,
    ).show(context);
  }

  static void showNeutral({required String title, required BuildContext context, VoidCallback? onTap}) {
    _buildFlushBar(
      icon: const Icon(
        Icons.info_outline,
        color: TmColors.white,
      ),
      context: context,
      title: title,
      backgroundColor: TmColors.disabledText,
      textColor: TmColors.white,
      onTap: onTap,
    ).show(context);
  }

  static Flushbar _buildFlushBar({
    required Widget icon,
    required Color textColor,
    required BuildContext context,
    required String title,
    required Color backgroundColor,
    VoidCallback? onTap,
  }) {
    return Flushbar(
      messageText: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          children: [
            Text(
              title,
              style: TmFonts.semiBold12.merge(TextStyle(color: textColor)),
            ),
            const Spacer(),
            FaIcon(
              FontAwesomeIcons.times,
              color: TmColors.white.withAlpha(60),
              size: 18,
            ),
          ],
        ),
      ),
      icon: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: icon,
      ),
      onTap: (flushbar) {
        Navigator.pop(context);
        if (onTap != null) {
          onTap();
        }
      },
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(5),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 10),
    );
  }
}
