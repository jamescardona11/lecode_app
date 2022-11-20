import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/app/widgets/round_container.dart';
import 'package:lepath_app/config/theme/styles/app_colors.dart';
import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/utils/utils.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

import 'web_view_problem.dart';

class ProblemItemWidget extends StatefulWidget {
  /// default constructor
  const ProblemItemWidget({
    Key? key,
    required this.problem,
    this.isLast = false,
    this.onTap,
    this.onTapCheckbox,
  }) : super(key: key);

  final DsaProblemModel problem;
  final VoidCallback? onTap;
  final VoidCallback? onTapCheckbox;

  final bool isLast;

  @override
  State<ProblemItemWidget> createState() => _ProblemItemWidgetState();
}

class _ProblemItemWidgetState extends State<ProblemItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WebViewExample(
              url: widget.problem.url,
            ),
          ),
        );
        // print(widget.problem.toString());
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.isLast ? 40 : 12),
        child: RoundContainer(
          height: 90,
          color: AppColors.pureWhite,
          border: 15,
          showDefaultShadow: true,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    RoundContainer(
                      width: 45,
                      height: 45,
                      border: 10,
                      color: difficultyColor,
                      child: Center(
                        child: FaIcon(
                          iconByTopic,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.problem.myRate.toStringAsFixed(2),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          // color: difficultyColor,
                          ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.problem.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          topicJoin,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.problem.routes.length,
                            itemBuilder: (_, index) {
                              final group = widget.problem.routes[index];

                              return Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: FaIcon(
                                  iconsForRoutes(group.value),
                                  size: 12,
                                  color: colorsForRoutes(group.value),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                _CheckboxWidget(
                  problem: widget.problem,
                  onTap: widget.onTapCheckbox,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color get difficultyColor {
    final difficulty = widget.problem.difficulty.toLowerCase();

    if (difficulty == 'easy') return Colors.blue;
    if (difficulty == 'medium') return Colors.orange;

    return Colors.red;
  }

  Color get myRateIcon {
    if (widget.problem.myRate > 100) {
      // return FontAwesomeIcons.dumbbell;
      return Colors.blue;
    } else if (widget.problem.myRate > 60) {
      // return FontAwesomeIcons.vial;
      return Colors.orange;
    }
    return Colors.red;
    // return FontAwesomeIcons.fire;
  }

  String get topicJoin =>
      widget.problem.topics.take(3).map((e) => '#${e.trim()}').join(',');

  IconData get iconByTopic =>
      widget.problem.topics.map((e) => _iconsForTopics(e)).first;

  List<IconData> get iconByGroup =>
      widget.problem.routes.map((e) => iconsForRoutes(e.value)).toList();

  IconData _iconsForTopics(String value) =>
      {
        'Array': FontAwesomeIcons.listOl,
        'Stack': FontAwesomeIcons.layerGroup,
        'Linked List': FontAwesomeIcons.link,
        'String': FontAwesomeIcons.font,
        'Binary Tree': FontAwesomeIcons.tree,
        'Tree': FontAwesomeIcons.tree,
        'Binary Search': FontAwesomeIcons.magnifyingGlass,
        'Graph': FontAwesomeIcons.connectdevelop,
        'BFS': FontAwesomeIcons.connectdevelop,
        'DFS': FontAwesomeIcons.connectdevelop,
        'Hash Table': FontAwesomeIcons.tableList,
        'DP': FontAwesomeIcons.chartSimple,
        'Priority Queue': FontAwesomeIcons.rankingStar,
        'Recursion': FontAwesomeIcons.repeat,
        'Math': FontAwesomeIcons.plusMinus,
        'Trie': FontAwesomeIcons.diceTwo,
        'Sort': FontAwesomeIcons.arrowUpRightDots,
      }[value] ??
      FontAwesomeIcons.question;
}

class _CheckboxWidget extends StatefulWidget {
  const _CheckboxWidget({
    Key? key,
    required this.problem,
    this.onTap,
  }) : super(key: key);

  final DsaProblemModel problem;
  final VoidCallback? onTap;

  @override
  State<_CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<_CheckboxWidget> {
  bool _isSolved = false;

  @override
  void initState() {
    _isSolved = widget.problem.isSolved;
    super.initState();
  }

  // todo: absorbPointer solo para mobile.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeSelectedState,
      child: AbsorbPointer(
        child: SizedBox(
          height: 70,
          width: 50,
          child: Center(
            child: MSHCheckbox(
              size: 25,
              value: _isSolved,
              colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                checkedColor: AppColors.green,
              ),
              style: MSHCheckboxStyle.stroke,
              onChanged: (selected) {},
            ),
          ),
        ),
      ),
    );
  }

  void changeSelectedState() {
    setState(() {
      _isSolved = !_isSolved;
      widget.onTap?.call();
    });
  }
}
