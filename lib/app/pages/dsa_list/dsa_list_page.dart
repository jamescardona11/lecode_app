import 'package:flutter/material.dart';

import 'package:lepath_app/app/pages/dsa_list/viewmodel/viewmodel.dart';
import 'package:lepath_app/app/widgets/exercise_item_widget.dart';
import 'package:lepath_app/config/di/di.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';
import 'package:lepath_app/core/core.dart';

class DsaListPage extends MvvMProviderWidget<DsaListViewModel, DsaListState> {
  /// default constructor
  const DsaListPage({
    super.key,
    this.title = '',
    this.description = '',
    this.group = '',
  });

  final String title;
  final String description;
  final String group;

  @override
  DsaListViewModel get viewModel => getIt<DsaListViewModel>();

  @override
  Widget buildWidget(BuildContext context, DsaListState state) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: AppBarRow(),
            backgroundColor: Colors.red,
            pinned: false,
            floating: true,
            snap: true,
            expandedHeight: 210.0,
            flexibleSpace: FlexibleSpaceBar(
              background: FlexibleBar(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: AppSizes.defPadding,
              left: AppSizes.defPadding,
              right: AppSizes.defPadding,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.items.length,
                (_, index) {
                  final item = state.items.elementAt(index);
                  return ExerciseItemWidget(
                    exercise: item,
                    isLast: index == state.items.length - 1,
                    onTap: () {},
                    onTapCheckbox: () {
                      viewModel.markProblemAsRead(item.id);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlexibleBar extends StatelessWidget {
  const FlexibleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            'Total Balance',
            style: TextStyle(fontSize: 15.0),
          ),
          Text(
            "\$3,048",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.more_horiz),
          Padding(
            padding:
                const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 5.0),
            child: Row(
              children: [
                Text(
                  "\$3,048",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "USD",
                  style: TextStyle(),
                ),
                Spacer(),
                Text(
                  "AUS \$3,800",
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 10.0),
            child: LinearProgressIndicator(
              minHeight: 5,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.black45,
              ),
              value: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarRow extends StatelessWidget {
  const AppBarRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        Icon(Icons.circle_outlined),
        Text(
          'My Spending',
          style: TextStyle(fontSize: 20.0),
        ),
        Icon(Icons.calendar_today),
      ],
    );
  }
}
