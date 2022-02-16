import 'package:flutter/material.dart';
import '../../configuration/tm_colors.dart';
import '../../configuration/tm_fonts.dart';

class DefaultClickableCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  final double elevation;

  const DefaultClickableCard({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.subtitle,
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
              title,
              style: titleStyle,
            ),
            subtitle: Text(
              subtitle,
              style: subtitleStyle,
            ),
            trailing: const Icon(
              Icons.chevron_right,
              color: TmColors.primaryGrey,
            ),
            onTap: onPressed,
          ),
        ),
      ],
    );
  }
}
