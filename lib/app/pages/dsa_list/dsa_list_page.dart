import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/app/pages/dsa_list/viewmodel/viewmodel.dart';
import 'package:lepath_app/app/pages/dsa_list/widgets/search_bar.dart';
import 'package:lepath_app/app/widgets/problem_item_widget.dart';
import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/config/context_extension.dart';
import 'package:lepath_app/config/di/di.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
                  'Let\'s start solving problems now',
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
                  return ProblemItemWidget(
                    problem: item,
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
          SearchBar(
            onTapOrderIcon: () {
              // context.read<DsaListViewModel>().changeMainView();
              showFloatingModalBottomSheet(
                context: context,
              );
            },
          ),
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

Future<T> showFloatingModalBottomSheet<T>({
  required BuildContext context,
  // required WidgetBuilder builder,
  Color? backgroundColor,
}) async {
  final result = await showCustomModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(),
      containerWidget: (_, animation, child) => FloatingModal(),
      expand: false);

  return result;
}

class FloatingModal extends StatefulWidget {
  final Color? backgroundColor;

  const FloatingModal({
    Key? key,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<FloatingModal> createState() => _FloatingModalState();
}

class _FloatingModalState extends State<FloatingModal> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Material(
          color: widget.backgroundColor,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: context.heightPct(70),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text('Difficulty:'),
                  ChipsChoice<String>.multiple(
                    value: tags,
                    onChanged: (val) => setState(() => tags = val),
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: options,
                      value: (i, v) => v,
                      label: (i, v) => v,
                    ),
                    choiceCheckmark: true,
                    choiceStyle: C2ChipStyle.outlined(),
                  ),
                  const SizedBox(height: 10),
                  Text('Topics:'),
                  ChipsChoice<String>.multiple(
                    value: tags2,
                    onChanged: (val) => setState(() => tags2 = val),
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: options2,
                      value: (i, v) => v,
                      label: (i, v) => v,
                    ),
                    choiceCheckmark: true,
                    wrapped: true,
                    choiceStyle: C2ChipStyle.filled(
                      selectedStyle: const C2ChipStyle(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Group by:'),
                  ChipsChoice<String>.single(
                    value: tag3,
                    onChanged: (val) => setState(() => tag3 = val),
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: options3,
                      value: (i, v) => v,
                      label: (i, v) => v,
                    ),
                    choiceCheckmark: true,
                    choiceStyle: C2ChipStyle.toned(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    wrapped: true,
                  ),
                  // Spacer(),
                  Row(
                    children: [],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> tags = [];
List<String> options = [
  'Easy',
  'Medium',
  'Hard',
];

String tag3 = '1';
List<String> options3 = [
  'Difficulty',
  'Topic',
];

List<String> tags2 = [];
List<String> options2 = [
  'Array',
  'Stack',
  'Linked List',
  'String',
  'Binary Tree',
  'Tree',
  'Binary Search',
  'Graph',
  'BFS',
  'DFS',
  'Hash Table',
  'DP',
  'Priority Queue',
  'Recursion',
  'Math',
  'Trie',
  'Sort',
];
