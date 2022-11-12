import 'package:flutter/material.dart';

import 'stepper.dart';

class VerticalStepperItem extends StatelessWidget {
  /// Stepper Item to show vertical stepper
  const VerticalStepperItem({
    Key? key,
    required this.item,
    required this.index,
    required this.itemsCount,
    required this.gap,
    required this.activeBarColor,
    required this.inActiveBarColor,
    required this.titleTextStyle,
    required this.subtitleTextStyle,
    this.iconCompleted,
    this.wasHeader = false,
    this.isSimpleDot = false,
  }) : super(key: key);

  /// Stepper item of type [StepperData] to inflate stepper with data
  final StepperData item;

  /// Index at which the item is present
  final int index;

  /// Total length of the list provided
  final int itemsCount;

  /// Gap between the items in the stepper
  final double gap;

  /// Bar color for active step
  final Color activeBarColor;

  /// Bar color for inactive step
  final Color inActiveBarColor;

  /// [TextStyle] for title
  final TextStyle titleTextStyle;

  /// [TextStyle] for subtitle
  final TextStyle subtitleTextStyle;

  final IconData? iconCompleted;

  final bool wasHeader;

  final bool isSimpleDot;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              color: index == 0 ? indexZeroColor : color,
              width: barWidth,
              height: gap,
            ),
            SizedBox(
              height: size,
              width: size,
              child: Center(
                child: item.isCompleted
                    ? Icon(
                        iconCompleted,
                        size: size,
                        color: activeBarColor,
                      )
                    : simpleDot(),
              ),
            ),
            Container(
              color: index == itemsCount - 1 ? Colors.transparent : color,
              width: barWidth,
              height: gap,
            ),
          ],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: item.child ??
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.title != null) ...[
                    Text(
                      item.title!,
                      textAlign: TextAlign.start,
                      style: titleTextStyle,
                    ),
                  ],
                  if (item.subtitle != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      item.subtitle!,
                      textAlign: TextAlign.start,
                      style: subtitleTextStyle,
                    ),
                  ],
                ],
              ),
        ),
      ],
    );
  }

  double get barWidth => 1.5;

  double get size => 20.0;

  Widget simpleDot() =>
      isSimpleDot ? SimpleStepperDot(color: color) : StepperDot(color: color);

  Color get color => item.isCompleted ? activeBarColor : inActiveBarColor;

  Color get indexZeroColor => wasHeader ? activeBarColor : Colors.transparent;
}
