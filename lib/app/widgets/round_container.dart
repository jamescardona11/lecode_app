import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  /// default constructor
  const RoundContainer({
    Key? key,
    this.width,
    this.height,
    this.border = 16,
    this.color = Colors.transparent,
    this.borderColor,
    this.child,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double border;

  final Color color;
  final Color? borderColor;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border),
        color: color,
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
              )
            : null,
      ),
      child: child,
    );
  }
}
