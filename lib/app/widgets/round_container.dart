import 'package:flutter/material.dart';

class RoundContainer extends StatelessWidget {
  /// default constructor
  const RoundContainer({
    Key? key,
    this.width,
    this.height,
    this.border = 16,
    this.color = Colors.transparent,
    this.showDefaultShadow = false,
    this.child,
    this.onTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double border;

  final Color color;

  final bool showDefaultShadow;

  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(border),
          color: color,
          boxShadow: shadow,
        ),
        child: child,
      ),
    );
  }

  List<BoxShadow>? get shadow => showDefaultShadow
      ? const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: -4,
            // offset: Offset(1, 1),
          )
        ]
      : null;
}
