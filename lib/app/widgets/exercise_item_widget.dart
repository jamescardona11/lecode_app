import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/app/widgets/round_container.dart';
import 'package:lepath_app/config/context_extension.dart';
import 'package:lepath_app/cross/cross.dart';

import 'circular_checkbox.dart';

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
        padding: EdgeInsets.only(bottom: widget.isLast ? 40 : 8),
        child: RoundContainer(
          width: context.widthPx,
          height: 100,
          border: 10,
          color: difficultyColor.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RoundContainer(
                  border: 10,
                  height: 70,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          iconByTopic,
                          size: 16,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.exercise.myRate.toStringAsFixed(2),
                          style: TextStyle(
                            color: myRateIcon,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.exercise.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        topicJoin,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        // overflow: TextOverflow.ellipsis,
                      )
                    ],
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
      widget.exercise.topics.map((e) => '#${e.trim()}').join(',');

  IconData get iconByTopic {
    final icon = widget.exercise.topics
        .map((e) => _iconForTopic[e])
        .where((element) => element != null);

    if (icon.isEmpty) return FontAwesomeIcons.question;

    return icon.first!;
  }

  Map<String, IconData> get _iconForTopic => {
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
      };
}

class _CompletedWidget extends StatelessWidget {
  const _CompletedWidget({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  final DsaExerciseModel exercise;

  @override
  Widget build(BuildContext context) {
    return exercise.completedDate == null
        ? Container(
            height: 70,
            width: 50,
            color: Colors.red,
            child: Center(
              child: CircularCheckBox(
                onChange: (value) {},
                isChecked: false,
              ),
            ),
          )
        : FaIcon(
            FontAwesomeIcons.check,
            color: Colors.white,
          );
  }
}

// share, favortitee, start, completed