import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/app/widgets/round_container.dart';
import 'package:lepath_app/config/theme/styles/app_colors.dart';
import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/utils/groups_exercises_utils.dart';

class ExerciseItemWidget extends StatefulWidget {
  /// default constructor
  const ExerciseItemWidget({
    Key? key,
    required this.exercise,
    this.isLast = false,
    this.onTap,
    this.onTapCheckbox,
  }) : super(key: key);

  final DsaExerciseModel exercise;
  final VoidCallback? onTap;
  final VoidCallback? onTapCheckbox;

  final bool isLast;

  @override
  State<ExerciseItemWidget> createState() => _ExerciseItemWidgetState();
}

class _ExerciseItemWidgetState extends State<ExerciseItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
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
                      widget.exercise.myRate.toStringAsFixed(2),
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
                          widget.exercise.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          topicJoin,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.exercise.groups.length,
                            itemBuilder: (_, index) {
                              final group = widget.exercise.groups[index];

                              return Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: FaIcon(
                                  iconsForGroups(group.value),
                                  size: 12,
                                  color: colorsForGroups(group.value),
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
                  exercise: widget.exercise,
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
    final difficulty = widget.exercise.difficulty.toLowerCase();

    if (difficulty == 'easy') return Colors.blue;
    if (difficulty == 'medium') return Colors.orange;

    return Colors.red;
  }

  Color get myRateIcon {
    if (widget.exercise.myRate > 100) {
      // return FontAwesomeIcons.dumbbell;
      return Colors.blue;
    } else if (widget.exercise.myRate > 60) {
      // return FontAwesomeIcons.vial;
      return Colors.orange;
    }
    return Colors.red;
    // return FontAwesomeIcons.fire;
  }

  String get topicJoin =>
      widget.exercise.topics.take(3).map((e) => '#${e.trim()}').join(',');

  IconData get iconByTopic =>
      widget.exercise.topics.map((e) => _iconsForTopics(e)).first;

  List<IconData> get iconByGroup =>
      widget.exercise.groups.map((e) => iconsForGroups(e.value)).toList();

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
    required this.exercise,
    this.onTap,
  }) : super(key: key);

  final DsaExerciseModel exercise;
  final VoidCallback? onTap;

  @override
  State<_CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<_CheckboxWidget> {
  bool _isSolved = false;

  @override
  void initState() {
    _isSolved = widget.exercise.isSolved;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeSelectedState,
      child: SizedBox(
        height: 70,
        width: 50,
        child: Center(
          child: Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.pureWhite,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.grey2,
                width: 1,
              ),
            ),
            child: Visibility(
              visible: _isSolved,
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.check,
                  color: AppColors.green,
                  size: 15,
                ),
              ),
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
