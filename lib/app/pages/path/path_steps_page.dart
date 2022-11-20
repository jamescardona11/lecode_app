import 'package:flutter/material.dart';
import 'package:lecode_app/app/widgets/stepper/stepper_data.dart';
import 'package:lecode_app/app/widgets/stepper/stepper_widget.dart';

class PathStepsPage extends StatefulWidget {
  /// default constructor
  const PathStepsPage({
    super.key,
  });

  @override
  State<PathStepsPage> createState() => _PathStepsPageState();
}

class _PathStepsPageState extends State<PathStepsPage> {
  // late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    // _pageController = PageController();
  }

  List<StepperData> stepperData = [
    StepperData(
      title: "Order Placed",
      subtitle: "Your order has been placed",
      // child: Container(
      //   width: 100,
      //   height: 50,
      //   color: Colors.amber,
      // ),
    ),
    StepperData(
      title: "Preparing",
      subtitle: "Your order is being prepared",
    ),
    StepperData(
      title: "On the way",
      subtitle: "Our delivery executive is on the way to deliver your item",
      isCompleted: true,
    ),
    StepperData(
      title: "Delivered",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StepperWidget(
        stepperList: stepperData,
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
        iconCompleted: Icons.check,
        isSimpleDot: true,
      ),
    );
  }
}
