import 'package:flutter/material.dart';

import 'stepper.dart';

class StepperWidget extends StatelessWidget {
  /// Another stepper is a package, which helps build
  /// customizable and easy to manage steppers.
  ///
  /// The package and be used to build horizontal as well
  /// as vertical steppers just by providing [Axis] in the [gap] parameter.
  const StepperWidget({
    Key? key,
    required this.stepperList,
    this.header,
    this.gap = 25,
    this.activeIndex = 0,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.iconCompleted,
    this.titleTextStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    this.subtitleTextStyle = const TextStyle(
      fontSize: 12,
      color: Colors.grey,
      fontWeight: FontWeight.w500,
    ),
    this.scrollPhysics,
    this.iconHeight,
    this.iconWidth,
    this.isSimpleDot = false,
    this.alreadyWatch = 0,
  }) : super(key: key);

  /// Stepper [List] of type [StepperData] to inflate stepper with data
  final List<StepperData> stepperList;

  /// Gap between the items in the stepper, Default = 40
  /// (Recommended to keep it greater than 20 in [Axis.vertical])
  /// (Recommended to keep it greater than 40 in [Axis.horizontal])
  final double gap;

  /// Active index, till which [index] the stepper will be highlighted
  final int activeIndex;

  /// Bar color for active step
  final Color activeColor;

  /// Bar color for inactive step
  final Color inactiveColor;

  /// Height of [StepperData.iconWidget]
  ///
  /// Default value = 20
  final double? iconHeight;

  /// Width of [StepperData.iconWidget]
  ///
  /// Default value = 20
  final double? iconWidth;

  final Widget? header;

  /// icon completed information
  final IconData? iconCompleted;

  /// [TextStyle] for title
  final TextStyle titleTextStyle;

  /// [TextStyle] for subtitle
  final TextStyle subtitleTextStyle;

  /// Scroll physics for listview
  final ScrollPhysics? scrollPhysics;

  final bool isSimpleDot;

  final int alreadyWatch;

  @override
  Widget build(BuildContext context) {
    final Iterable<int> iterable = Iterable<int>.generate(stepperList.length);
    return Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.vertical,
        children: [
          if (header != null)
            Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: CustomPaint(
                    painter: ArcProgress(
                      alreadyWatch: alreadyWatch,
                      numberOfArc: 3,
                      spacing: 50,
                      strokeWidth: 7,
                      seenColor: activeColor,
                      unSeenColor: inactiveColor,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                header!,
              ],
            ),
          const SizedBox(height: 5),
          ...iterable.map((index) => _getPreferredStepper(index)).toList(),
        ]);
  }

  Widget _getPreferredStepper(index) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: VerticalStepperItem(
        index: index,
        item: stepperList[index],
        itemsCount: stepperList.length,
        gap: gap,
        inActiveBarColor: inactiveColor,
        activeBarColor: activeColor,
        titleTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
        iconCompleted: iconCompleted,
        wasHeader: header != null,
        isSimpleDot: isSimpleDot,
      ),
    );
  }
}
