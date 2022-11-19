import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/app/pages/dsa_list/viewmodel/viewmodel.dart';
import 'package:lepath_app/app/pages/dsa_list/widgets/search_bar.dart';
import 'package:lepath_app/app/widgets/exercise_item_widget.dart';
import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/config/di/di.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';

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
          SliverAppBar(
            title: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(FontAwesomeIcons.code),
                    const SizedBox(width: 5),
                    Text(
                      'All problems',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  'Let\'s start solving problems',
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
            backgroundColor: AppColors.blueBlack,
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
        children: [
          SearchBar(),
          const SizedBox(height: 10),
          Padding(
            padding:
                const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 5.0),
            child: Row(
              children: [
                Text(
                  '10/300',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                Text(
                  '10%',
                  // style: TextStyle(),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 10.0),
            child: LinearProgressIndicator(
              minHeight: 3,
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
