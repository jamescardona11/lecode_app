import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:lepath_app/app/widgets/eleventh_button_widget.dart';
import 'package:lepath_app/config/context_extension.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';
import 'package:lepath_app/core/core.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<T> showFloatingModalBottomSheet<T>({
  required BuildContext context,
  FilteringData? initialData,
  ValueChanged<FilteringData>? onFilterTap,
}) async {
  final result = await showCustomModalBottomSheet(
    context: context,
    builder: (_) => const SizedBox(),
    containerWidget: (_, animation, child) => FloatingModal(
      onFilterTap: onFilterTap,
      initialData: initialData,
    ),
    expand: false,
  );

  return result;
}

class FloatingModal extends StatefulWidget {
  const FloatingModal({
    Key? key,
    this.onFilterTap,
    this.initialData,
  }) : super(key: key);

  final ValueChanged<FilteringData>? onFilterTap;
  final FilteringData? initialData;

  @override
  State<FloatingModal> createState() => _FloatingModalState();
}

class _FloatingModalState extends State<FloatingModal> {
  List<String> difficultyTags = [];
  String groupByTag = '';
  List<String> topicsTags = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialData != null) {
      difficultyTags.addAll(widget.initialData!.difficulty);
      groupByTag = widget.initialData!.groupBy;
      topicsTags.addAll(widget.initialData!.topics);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Material(
          color: AppColors.pureWhite,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: context.heightPct(70),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Difficulty:',
                    style: defHeadline,
                  ),
                  ChipsChoice<String>.multiple(
                    value: difficultyTags,
                    onChanged: (val) => setState(() => difficultyTags = val),
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: difficultyOptions,
                      value: (i, v) => v,
                      label: (i, v) => v,
                    ),
                    padding: const EdgeInsets.all(0),
                    choiceCheckmark: true,
                    choiceStyle: C2ChipStyle.toned(
                      foregroundStyle: chipsStyle,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Topics:',
                    style: defHeadline,
                  ),
                  const SizedBox(height: 5),
                  ChipsChoice<String>.multiple(
                    value: topicsTags,
                    onChanged: (val) => setState(() => topicsTags = val),
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: topicOptions,
                      value: (i, v) => v,
                      label: (i, v) => v,
                    ),
                    choiceCheckmark: true,
                    padding: const EdgeInsets.all(0),
                    wrapped: true,
                    choiceStyle: C2ChipStyle.filled(
                      foregroundStyle: chipsStyle,
                      selectedStyle: const C2ChipStyle(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Group by:',
                    style: defHeadline,
                  ),
                  const SizedBox(height: 5),
                  ChipsChoice<String>.single(
                    value: groupByTag,
                    onChanged: (val) => setState(() => groupByTag = val),
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: groupsOptions,
                      value: (i, v) => v,
                      label: (i, v) => v,
                    ),
                    padding: const EdgeInsets.all(0),
                    choiceCheckmark: true,
                    choiceStyle: C2ChipStyle.toned(
                      foregroundStyle: chipsStyle,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    wrapped: true,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: context.widthPct(80),
                    child: Row(
                      children: [
                        Expanded(
                          child: EleventhButton(
                            label: 'Cancel',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: EleventhButton(
                            label: 'Filter',
                            primaryColor: AppColors.blueBlack,
                            accentColor: AppColors.white,
                            onPressed: () {
                              widget.onFilterTap?.call(FilteringData(
                                difficulty: difficultyTags,
                                groupBy: groupByTag,
                                topics: topicsTags,
                              ));

                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> difficultyOptions = [
    'Easy',
    'Medium',
    'Hard',
  ];

  List<String> groupsOptions = [
    'Difficulty',
    'Topic',
  ];

  List<String> topicOptions = [
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

  TextStyle get chipsStyle => const TextStyle(
        fontSize: 13,
      );

  TextStyle get defHeadline => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );
}
