import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/app/widgets/problem_item_widget.dart';
import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/config/di/di.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';

import 'viewmodel/dsa_solved_list_state.dart';
import 'viewmodel/dsa_solved_list_viewmodel.dart';

class DsaSolvedProblemsPage
    extends MvvMProviderWidget<DsaSolvedListViewModel, DsaSolvedListState> {
  /// default constructor
  const DsaSolvedProblemsPage({
    super.key,
  });

  @override
  DsaSolvedListViewModel get viewModel => getIt<DsaSolvedListViewModel>();

  @override
  Widget buildWidget(BuildContext context, DsaSolvedListState state) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: AppSizes.defPadding,
          right: AppSizes.defPadding,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  FaIcon(
                    FontAwesomeIcons.code,
                    size: 18,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Solved Problems',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 20),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.items.length,
                (_, index) {
                  final item = state.items.elementAt(index);

                  return ProblemItemWidget(
                    key: ValueKey(index),
                    problem: item,
                    // isLast: index == state.similarProblems.length - 1,
                    // onTap: () {},
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
