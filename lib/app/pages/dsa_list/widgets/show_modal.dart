import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:lepath_app/app/widgets/eleventh_button_widget.dart';
import 'package:lepath_app/config/context_extension.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
                    value: tags,
                    onChanged: (val) => setState(() => tags = val),
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: options,
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
                    value: tags2,
                    onChanged: (val) => setState(() => tags2 = val),
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: options2,
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
                    value: tag3,
                    onChanged: (val) => setState(() => tag3 = val),
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: options3,
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
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: EleventhButton(
                            label: 'Filter',
                            primaryColor: AppColors.blueBlack,
                            accentColor: AppColors.white,
                            onPressed: () {},
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

  TextStyle get chipsStyle => const TextStyle(
        fontSize: 13,
      );

  TextStyle get defHeadline => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );
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
