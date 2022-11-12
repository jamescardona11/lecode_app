import 'package:flutter/material.dart';

class StepperDot extends StatelessWidget {
  /// Default stepper dot
  const StepperDot({
    Key? key,
    required this.color,
  }) : super(key: key);

  /// Index at which the item is present
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: 14,
          width: 14,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: color,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}

class SimpleStepperDot extends StatelessWidget {
  /// Default stepper dot
  const SimpleStepperDot({
    Key? key,
    required this.color,
  }) : super(key: key);

  /// Color dot
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 10,
        width: 10,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
