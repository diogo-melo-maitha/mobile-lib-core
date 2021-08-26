import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

class TmDefaultToolbar extends StatelessWidget {
  static const Key popButtonKey = Key('popButtonKey');

  final double iconSize;
  final VoidCallback? onPressed;
  final Widget centerWidget;
  final Widget rightWidget;

  const TmDefaultToolbar({
    Key? key,
    this.onPressed,
    this.iconSize = 38,
    this.centerWidget = const Text(''),
    this.rightWidget = const Text(''),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 6,
          bottom: 16,
          left: 14,
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  key: TmDefaultToolbar.popButtonKey,
                  splashRadius: 0.1,
                  iconSize: iconSize,
                  onPressed: onPressed ?? Modular.to.pop,
                  icon: SvgPicture.asset(
                    'assets/images/left_chevron.svg',
                    package: 'tm_lib_core',
                    width: iconSize,
                    height: iconSize,
                  ),
                ),
                rightWidget,
              ],
            ),
            Center(child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: centerWidget,
            )),
          ],
        ),
      ),
    );
  }
}
