import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';

import '../../configuration/tm_colors.dart';
import '../../configuration/tm_fonts.dart';
import '../../utils/format_utils.dart';

class TmLimitInformationChart extends StatelessWidget {
  static const Key absorbKey = Key('absorbKey');
  static final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();
  static final GlobalKey<AnimatedCircularChartState> _chartKey2 =
      GlobalKey<AnimatedCircularChartState>();

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 89),
          child: Stack(
            children: [
              Positioned(
                bottom: 15,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  // color: Colors.black38,
                  alignment: Alignment.center,
                  child: AnimatedCircularChart(
                    key: _chartKey,
                    holeRadius: 100,
                    size: const Size(245, 100),
                    initialChartData: const <CircularStackEntry>[
                      CircularStackEntry(
                        <CircularSegmentEntry>[
                          CircularSegmentEntry(
                            100,
                            TmColors.iceGrey,
                            rankKey: 'completed',
                          ),
                        ],
                      ),
                    ],
                    edgeStyle: SegmentEdgeStyle.round,
                    percentageValues: true,
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  alignment: Alignment.center,
                  child: AnimatedCircularChart(
                    key: _chartKey2,
                    holeRadius: 88,
                    size: const Size(300, 100),
                    initialChartData: <CircularStackEntry>[
                      CircularStackEntry(
                        <CircularSegmentEntry>[
                          CircularSegmentEntry(
                            purchaseToProcess,
                            TmColors.accent,
                            rankKey: 'completed',
                          ),
                          CircularSegmentEntry(
                            processedPurchase,
                            TmColors.waterBlue,
                            rankKey: 'completed',
                          ),
                          CircularSegmentEntry(
                            availableLimit,
                            Colors.transparent,
                            rankKey: 'remaining',
                          ),
                        ],
                        rankKey: 'progress',
                      ),
                    ],
                    edgeStyle: SegmentEdgeStyle.round,
                  ),
                ),
              ),
              Container(
                // color: Colors.blue.shade50,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Utilizado',
                          style: TmFonts.regular14.merge(
                              const TextStyle(color: TmColors.whiteGrey)),
                        ),
                        Text(
                          FormatUtils.moneyFormat(usedLimit),
                          style: TmFonts.bold24.merge(
                              const TextStyle(color: TmColors.waterBlue)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            'Limite',
                            style: TmFonts.regular14.merge(
                                const TextStyle(color: TmColors.whiteGrey)),
                          ),
                          Text(
                            'disponível',
                            style: TmFonts.regular14.merge(
                                const TextStyle(color: TmColors.whiteGrey)),
                          ),
                          Text(
                            FormatUtils.moneyFormat(availableLimit),
                            style: TmFonts.bold24.merge(
                                const TextStyle(color: TmColors.iceGrey)),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildSubtitle(TmColors.waterBlue, processedPurchase, 'Compras processadas'),
            buildSubtitle(TmColors.accent, purchaseToProcess, 'Compras a processar')
          ],
        )
      ],
    );
  }

  Widget buildSubtitle(Color dotColor, double value, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          FormatUtils.moneyFormat(value),
          style: TmFonts.semiBold16
              .merge(const TextStyle(color: TmColors.blackGrey)),
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
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  title,
                  style: TmFonts.semiBold12
                      .merge(const TextStyle(color: TmColors.mediumGrey)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
