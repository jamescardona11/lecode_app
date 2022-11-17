import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lepath_app/app/pages/dashboard/viewmodel/dashboard_state.dart';
import 'package:lepath_app/app/pages/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:lepath_app/app/widgets/widgets.dart';
import 'package:lepath_app/config/context_extension.dart';
import 'package:lepath_app/config/di/di.dart';
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
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello there <🖐>',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: 20),
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
                                  const SizedBox(height: 20),
                                  Expanded(
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
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        log(state.randomExercises.toString());
                      },
                      child: RoundContainer(
                        width: context.widthPx,
                        height: 50,
                        border: 10,
                        color: Colors.yellow,
                        child: Center(
                          child: Text(
                            'Random Pick',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Similar that your last solved exercise ${state.similarExercises.length}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.similarExercises.length,
                (_, index) {
                  final item = state.similarExercises.elementAt(index);

                  return ExerciseItemWidget(
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
