import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/app/widgets/round_container.dart';
import 'package:lepath_app/config/context_extension.dart';
import 'package:lepath_app/config/styles/app_colors.dart';
import 'package:lepath_app/cross/cross.dart';

class ExerciseItemWidget extends StatefulWidget {
  /// default constructor
  const ExerciseItemWidget({
    Key? key,
    required this.exercise,
    this.isLast = false,
    this.onTap,
  }) : super(key: key);

  final DsaExerciseModel exercise;
  final VoidCallback? onTap;
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
        child: SizedBox(
          height: 90,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.pureWhite,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: -2,
                  offset: Offset(0, 1),
                )
              ],
            ),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (c) {},
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                    // borderRadius: BorderRadius.circular(15),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  SlidableAction(
                    onPressed: (c) {},
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: FontAwesomeIcons.splotch,
                    label: 'Favorite',
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ],
              ),
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
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
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
                            // Text(
                            //   groupJoin,
                            //   style: TextStyle(
                            //     fontSize: 12,
                            //   ),
                            //   // overflow: TextOverflow.ellipsis,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    _CompletedWidget(
                      exercise: widget.exercise,
                    )
                  ],
                ),
              ),
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

  IconData get iconByGroup =>
      widget.exercise.groups.map((e) => _iconsForGroups(e.value)).first;

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
        'Dynamic Programming': FontAwesomeIcons.chartSimple,
        'Priority Queue': FontAwesomeIcons.rankingStar,
        'Recursion': FontAwesomeIcons.repeat,
        'Math': FontAwesomeIcons.plusMinus,
        'Trie': FontAwesomeIcons.diceTwo,
        'Sort': FontAwesomeIcons.arrowUpRightDots,
      }[value] ??
      FontAwesomeIcons.question;

  static IconData _iconsForGroups(String value) =>
      {
        'Blind75': FontAwesomeIcons.chessKnight,
        'Grind75': FontAwesomeIcons.chessRook,
        'Top Liked': FontAwesomeIcons.heart,
        'LeetCode60': FontAwesomeIcons.droplet,
        'Top Interview': FontAwesomeIcons.brain,
        'Curated Algo': FontAwesomeIcons.cookieBite,
      }[value] ??
      FontAwesomeIcons.feather;
}

class _CompletedWidget extends StatefulWidget {
  const _CompletedWidget({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  final DsaExerciseModel exercise;

  @override
  State<_CompletedWidget> createState() => _CompletedWidgetState();
}

class _CompletedWidgetState extends State<_CompletedWidget> {
  bool _isSelected = false;

  @override
  void initState() {
    // _isSelected = widget.isChecked ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeSelectedState,
      child: widget.exercise.solvedDate == null
          ? SizedBox(
              height: 70,
              width: 50,
              child: Center(
                child: AnimatedContainer(
                  width: 30,
                  height: 30,
                  margin: const EdgeInsets.all(4),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  decoration: BoxDecoration(
                    color: AppColors.pureWhite,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.grey2,
                      width: 1,
                    ),
                  ),
                  child: Visibility(
                    visible: _isSelected,
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
            )
          : const FaIcon(
              FontAwesomeIcons.check,
              color: Colors.white,
            ),
    );
  }

  void changeSelectedState() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }
}
