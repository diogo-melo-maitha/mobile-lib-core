import 'package:flutter/material.dart';

import '../../configuration/tm_colors.dart';
import '../../configuration/tm_fonts.dart';
import '../../extensions/tm_double_extension.dart';
import 'tm_pie_chart.dart';

class TmLimitInformationChart extends StatelessWidget {
  static const Key usedLimitTextKey = Key('usedLimitText');
  static const Key availableLimitTextKey = Key('availableLimitText');
  static const Key availableLimitChartKey = Key('availableLimitChart');

  final double availableLimit;
  final double usedLimit;
  final double processedPurchase;
  final double purchaseToProcess;

  const TmLimitInformationChart({
    Key? key,
    required this.availableLimit,
    required this.usedLimit,
    required this.processedPurchase,
    required this.purchaseToProcess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = TmFonts.regular14.merge(const TextStyle(color: TmColors.whiteGrey));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 45, bottom: 57),
          child: Stack(
            children: [
              TmPieChart(availableLimit: availableLimit, usedLimit: usedLimit, processedPurchase: processedPurchase, purchaseToProcess: purchaseToProcess),
              // buildPieChart(),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Utilizado',
                          style: titleStyle,
                        ),
                        Text(
                          usedLimit.toCurrency(),
                          key: TmLimitInformationChart.usedLimitTextKey,
                          style: TmFonts.bold24.merge(const TextStyle(color: TmColors.waterBlue)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            'Limite',
                            style: titleStyle,
                          ),
                          Text(
                            'disponível',
                            style: titleStyle,
                          ),
                          Text(
                            availableLimit.toCurrency(),
                            key: TmLimitInformationChart.availableLimitTextKey,
                            style: TmFonts.bold24.merge(const TextStyle(color: TmColors.iceGrey)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSubtitle(TmColors.waterBlue, processedPurchase, 'Compras processadas'),
              buildSubtitle(TmColors.accent, purchaseToProcess, 'Compras a processar')
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSubtitle(Color dotColor, double value, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value.toCurrency(),
          style: TmFonts.semiBold16.merge(const TextStyle(color: TmColors.blackGrey)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  title,
                  style: TmFonts.semiBold12.merge(const TextStyle(color: TmColors.mediumGrey)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}