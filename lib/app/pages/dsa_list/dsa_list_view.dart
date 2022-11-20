import 'package:flutter/material.dart';
import 'package:grouped_list/sliver_grouped_list.dart';
import 'package:lepath_app/app/pages/dsa_list/viewmodel/viewmodel.dart';
import 'package:lepath_app/app/widgets/problem_item_widget.dart';
import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/config/di/di.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';
import 'package:lepath_app/core/core.dart';

import 'widgets/sliver_bar/sliver_app_bar.dart';

class DsaListView extends MvvMProviderWidget<DsaListViewModel, DsaListState> {
  /// default constructor
  const DsaListView({
    super.key,
    required this.title,
    required this.description,
    this.showProgress = true,
    this.color = AppColors.blueBlack,
    this.filteringData = const FilteringData(),
  });

  final String title;
  final String description;
  final bool showProgress;
  final Color color;
  final FilteringData filteringData;

  @override
  DsaListViewModel get viewModel =>
      getIt<DsaListViewModel>()..filteringData(filteringData);

  @override
  Widget buildWidget(BuildContext context, DsaListState state) {
    return CustomScrollView(
      slivers: [
        SliverBar(
          title: title,
          description: description,
          showProgress: showProgress,
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            left: AppSizes.defPadding,
            right: AppSizes.defPadding,
          ),
          sliver: SliverGroupedListView(
            elements: state.items.toList(),
            groupBy: (element) => '',
            groupSeparatorBuilder: (String groupByValue) => Text(groupByValue),
            itemBuilder: (_, problem) => ProblemItemWidget(
              problem: problem,
              onTapCheckbox: () {
                viewModel.markProblemAsRead(problem.id);
              },
            ),
            // itemComparator: (item1, item2) =>
            //     item1['name'].compareTo(item2['name']), // optional
            order: GroupedListOrder.ASC, // optional
          ),
        ),
      ],
    );
  }
}
