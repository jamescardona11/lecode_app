import 'dart:developer';

import 'package:drip/drip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/app/pages/dashboard/viewmodel/dashboard_state.dart';
import 'package:lepath_app/app/pages/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:lepath_app/app/widgets/widgets.dart';
import 'package:lepath_app/config/context_extension.dart';
import 'package:lepath_app/config/di/di.dart';
import 'package:lepath_app/config/styles/app_colors.dart';
import 'package:lepath_app/core/core.dart';

import 'widgets/activity_by_days_widget.dart';
import 'widgets/total_stats_widget.dart';

/// slivers
class DashboardPage
    extends MvvMProviderWidget<DashboardViewModel, DashboardState> {
  /// default constructor
  const DashboardPage({
    super.key,
  });

  @override
  DashboardViewModel get viewModel => getIt<DashboardViewModel>();

  // activity
  // percent completed
  // Goal ?? Random Pick ?? Score indicator ?? leetCode
  // random pick first card
  // random similar to my last solved
  @override
  Widget buildWidget(BuildContext context, DashboardState state) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 0,
          left: 16,
          right: 16,
        ),
        child: CustomScrollView(
          slivers: [
            const _GraphBoxes(),
            SliverToBoxAdapter(
              child: Text(
                'Similar to the last exercise solved',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 5),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.similarExercises.length,
                (_, index) {
                  final item = state.similarExercises.elementAt(index);

                  return ExerciseItemWidget(
                    key: ValueKey(index),
                    exercise: item,
                    isLast: index == state.similarExercises.length - 1,
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GraphBoxes extends StatelessWidget {
  const _GraphBoxes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DripBuilder<DashboardViewModel, DashboardState>(
      builder: (context, state) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello there <🖐>',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: context.widthPx,
                height: context.heightPct(40),
                child: LayoutBuilder(
                  builder: (context, constraints) => Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ActivityContainer(
                        width: constraints.maxWidth / 2,
                        statsModel: state.statsModel,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TotalStatsWidget(
                                statsModel: state.statsModel,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Expanded(
                              flex: 3,
                              child: RoundContainer(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  log(state.randomExercises.toString());
                },
                child: RoundContainer(
                  width: context.widthPx,
                  height: 50,
                  border: 10,
                  color: AppColors.blueDark,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Seek a random exercise',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: AppColors.white),
                        ),
                        const SizedBox(width: 5),
                        const FaIcon(
                          FontAwesomeIcons.hurricane,
                          color: AppColors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
