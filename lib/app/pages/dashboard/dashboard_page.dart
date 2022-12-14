import 'dart:developer';

import 'package:drip/drip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lecode_app/app/pages/dashboard/viewmodel/dashboard_state.dart';
import 'package:lecode_app/app/pages/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:lecode_app/app/widgets/widgets.dart';
import 'package:lecode_app/base/base.dart';
import 'package:lecode_app/config/context_extension.dart';
import 'package:lecode_app/config/di/di.dart';
import 'package:lecode_app/config/theme/styles/styles.dart';

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
      backgroundColor: state.similarProblems.isEmpty
          ? AppColors.pureWhite
          : AppColors.backgroundScaffold,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 0,
          left: AppSizes.defPadding,
          right: AppSizes.defPadding,
        ),
        child: CustomScrollView(
          slivers: [
            const _GraphBoxes(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Text(
                    'Similar to the last problem solved',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  if (state.similarProblems.isEmpty)
                    Image.asset(
                      AppAssets.waitingImg,
                      width: 180,
                    )
                ],
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 5),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.similarProblems.length,
                (_, index) {
                  final item = state.similarProblems.elementAt(index);

                  return ProblemItemWidget(
                    key: ValueKey(index),
                    problem: item,
                    isLast: index == state.similarProblems.length - 1,
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
                'Hello there <????>',
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
              RoundContainer(
                width: context.widthPx,
                height: 50,
                border: 10,
                color: AppColors.blueDark,
                onTap: () {
                  log(state.randomProblems.toString());
                },
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pick one',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: AppColors.white),
                      ),
                      const SizedBox(width: 8),
                      const FaIcon(
                        FontAwesomeIcons.shuffle,
                        color: AppColors.white,
                        size: 18,
                      )
                    ],
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
