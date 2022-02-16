import 'package:flutter/material.dart';
import '../../configuration/tm_colors.dart';
import '../../configuration/tm_fonts.dart';

class DefaultClickableCard extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final VoidCallback onClick;
  final double elevation;

  const DefaultClickableCard({
    Key? key,
    required this.onClick,
    required this.primaryText,
    required this.secondaryText,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = TmFonts.semiBold16
        .merge(const TextStyle(color: TmColors.textOnSurface));
    final TextStyle subtitleStyle =
    TmFonts.regular12.merge(const TextStyle(color: TmColors.secondaryGrey));

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: TmColors.white,
            border: const Border(bottom: BorderSide(color: TmColors.primaryGrey)),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(0, elevation),
                blurRadius: elevation,
              ),
            ],
          ),
          child: ListTile(
            title: Text(
              primaryText,
              style: titleStyle,
            ),
            subtitle: Text(
              secondaryText,
              style: subtitleStyle,
            ),
            trailing: const Icon(
              Icons.chevron_right,
              color: TmColors.primaryGrey,
            ),
            onTap: onClick,
          ),
        ),
      ],
    );
  }
}
