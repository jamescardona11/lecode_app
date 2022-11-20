import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lecode_app/app/widgets/widgets.dart';
import 'package:lecode_app/config/theme/styles/app_colors.dart';
import 'package:lecode_app/core/core.dart';

class ActivityContainer extends StatelessWidget {
  const ActivityContainer({
    Key? key,
    required this.width,
    required this.statsModel,
  }) : super(key: key);

  final StatsModel statsModel;
  final double width;

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      width: width,
      color: AppColors.primary,
      child: !statsModel.isEmpty
          ? Column(
              children: [
                _SolvedProblemsByDay(
                  statsModel: statsModel,
                ),
                Text(
                  'Activity',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                ),
                Text(
                  'of current week',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Last 30 days: ',
                        style: Theme.of(context).textTheme.bodyText1),
                    Text(
                      '${statsModel.last30Days}',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            )
          : Center(
              child: Text(
                'Waiting for activity...',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
    );
  }
}

class _SolvedProblemsByDay extends StatelessWidget {
  /// default constructor
  const _SolvedProblemsByDay({
    Key? key,
    required this.statsModel,
  }) : super(key: key);

  final StatsModel statsModel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: Card(
        elevation: 0,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        color: Colors.transparent,
        child: BarChart(
          BarChartData(
            barTouchData: barTouchData,
            titlesData: titlesData,
            borderData: borderData,
            barGroups: barGroups,
            gridData: FlGridData(show: false),
            maxY: maxY,
          ),
        ),
      ),
    );
  }

  double get maxY => statsModel.daysStats.isEmpty
      ? 0.0
      : statsModel.daysStats.reduce(max) + 3.0;

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 2,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            final value = rod.toY.round();
            return BarTooltipItem(
              value == 0 ? '' : value.toString(),
              const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.secondary,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text =
        value.toInt() == 0 ? '-' : statsModel.daysLabel[value.toInt()][0];

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: Text(
        text,
        style: style,
      ),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups {
    List<BarChartGroupData> bars = [];
    for (int i = statsModel.daysStats.length - 1; i >= 0; i--) {
      bars.add(BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: statsModel.daysStats[i] * 1.0,
            color: AppColors.secondary,
          )
        ],
        showingTooltipIndicators: [0],
      ));
    }

    return bars;
  }
}
