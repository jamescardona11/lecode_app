import 'package:flutter/material.dart';

class StepperData {
  /// title for the stepper
  final String? title;

  /// subtitle for the stepper
  final String? subtitle;

  final Widget? child;

  final bool isCompleted;

  /// Use the constructor of [StepperData] to pass the data needed.
  StepperData({
    this.title,
    this.subtitle,
    this.child,
    this.isCompleted = false,
  });
}
