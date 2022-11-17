import 'package:flutter/material.dart';
import 'package:lepath_app/app/widgets/widgets.dart';
import 'package:lepath_app/config/styles/app_colors.dart';
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
    return RoundContainer(
      // color: Colors.teal.shade200.withOpacity(0.4),
      color: AppColors.blueLight,
      child: Padding(
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
              color: AppColors.green,
            ),
            const SizedBox(height: 5),
            _ItemStats(
              label: 'Medium',
              solved: widget.statsModel.mediumSolved,
              total: widget.statsModel.medium,
              color: AppColors.yellow,
            ),
            const SizedBox(height: 5),
            _ItemStats(
              label: 'Hard',
              solved: widget.statsModel.hardSolved,
              total: widget.statsModel.hard,
              color: AppColors.red,
            ),
          ],
        ),
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
    this.color = AppColors.blue,
  }) : super(key: key);

  final String label;
  final int solved;
  final int total;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final newTotal = total == 0 ? 1 : total;
    final percent = (solved / newTotal);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('$label: ',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w600)),
            Text('$solved / $total',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
        Row(
          children: [
            Text(
              '${AppFormatter.getPercent(percent * 100)}%',
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10),
            ),
            Expanded(
              child: LinearPercentIndicator(
                lineHeight: 3.0,
                percent: percent + 0.2,
                barRadius: const Radius.circular(10),
                backgroundColor: AppColors.grey2,
                progressColor: color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
