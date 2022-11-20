import 'package:flutter/material.dart';
import 'package:grouped_list/sliver_grouped_list.dart';
import 'package:lepath_app/app/pages/dsa_list/viewmodel/viewmodel.dart';
import 'package:lepath_app/app/widgets/problem_item_widget.dart';
import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/config/di/di.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';

import 'widgets/sliver_bar/sliver_app_bar.dart';

class DsaListPage extends MvvMProviderWidget<DsaListViewModel, DsaListState> {
  /// default constructor
  const DsaListPage({
    super.key,
    this.title = 'All problems',
    this.description = 'Let\'s start solving problems now.',
    this.group = '',
    this.color = AppColors.blueBlack,
  });

  final String title;
  final String description;
  final String group;
  final Color color;

  @override
  DsaListViewModel get viewModel => getIt<DsaListViewModel>();

  @override
  Widget buildWidget(BuildContext context, DsaListState state) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverBar(
            title: title,
            description: description,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: AppSizes.defPadding,
              right: AppSizes.defPadding,
            ),
            sliver: SliverGroupedListView(
              elements: state.items.toList(),
              groupBy: (element) => '',
              groupSeparatorBuilder: (String groupByValue) =>
                  Text(groupByValue),
              itemBuilder: (_, problem) => ProblemItemWidget(
                problem: problem,
                // isLast: s == state.items.length - 1,
                onTap: () {},
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
      ),
    );
  }
}
