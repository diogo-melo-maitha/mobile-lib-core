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
  final bool haveButton;

  const TmDefaultToolbar({
    Key? key,
    this.onPressed,
    this.iconSize = 38,
    this.centerWidget = const Text(''),
    this.rightWidget = const Text(''),
    this.haveButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.0602,
          left: 7,
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (haveButton)
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
                if (!haveButton) const Spacer(),
                rightWidget,
              ],
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: centerWidget,
            )),
          ],
        ),
      ),
    );
  }
}
