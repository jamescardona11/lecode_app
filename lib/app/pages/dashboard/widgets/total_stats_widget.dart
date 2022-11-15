import 'package:flutter/material.dart';
import 'package:lepath_app/utils/app_formatter.dart';
import 'package:lepath_app/cross/cross.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TotalStatsWidget extends StatefulWidget {
  /// default constructor
  const TotalStatsWidget({
    Key? key,
    required this.statsModel,
  }) : super(key: key);

  final StatsModel statsModel;

  @override
  State<TotalStatsWidget> createState() => _TotalStatsWidgetState();
}

class _TotalStatsWidgetState extends State<TotalStatsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ItemStats(
            label: 'Total',
            solved: widget.statsModel.solved,
            total: widget.statsModel.total,
          ),
          const SizedBox(height: 5),
          _ItemStats(
            label: 'Easy',
            solved: widget.statsModel.easySolved,
            total: widget.statsModel.easy,
          ),
          const SizedBox(height: 5),
          _ItemStats(
            label: 'Medium',
            solved: widget.statsModel.mediumSolved,
            total: widget.statsModel.medium,
          ),
          const SizedBox(height: 5),
          _ItemStats(
            label: 'Hard',
            solved: widget.statsModel.hardSolved,
            total: widget.statsModel.hard,
          ),
        ],
      ),
    );
  }
}

class _ItemStats extends StatelessWidget {
  const _ItemStats({
    Key? key,
    required this.label,
    required this.solved,
    required this.total,
    this.color = Colors.blue,
  }) : super(key: key);

  final String label;
  final int solved;
  final int total;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final newTotal = total == 0 ? 1 : total;
    final percent = (solved / newTotal) * 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: $solved/$total'),
        Row(
          children: [
            Text(
              '${AppFormatter.getPercent(percent)}%',
              style: TextStyle(fontSize: 12),
            ),
            Expanded(
              child: LinearPercentIndicator(
                lineHeight: 4.0,
                percent: 0.5,
                barRadius: const Radius.circular(10),
                backgroundColor: Colors.grey,
                progressColor: color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
