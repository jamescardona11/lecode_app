import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircularCheckBox extends StatefulWidget {
  const CircularCheckBox({
    Key? key,
    required this.onChange,
    this.isChecked,
  }) : super(key: key);

  final ValueChanged<bool> onChange;
  final bool? isChecked;

  @override
  State<CircularCheckBox> createState() => _CircularCheckBoxState();
}

class _CircularCheckBoxState extends State<CircularCheckBox> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isChecked ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeSelectedState,
      child: AnimatedContainer(
        width: 25,
        height: 25,
        margin: const EdgeInsets.all(4),
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: _isSelected ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
        ),
        child: Visibility(
          visible: _isSelected,
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.check,
              color: Colors.black,
              size: 12,
            ),
          ),
        ),
      ),
    );
  }

  void changeSelectedState() {
    setState(() {
      _isSelected = !_isSelected;
      widget.onChange(_isSelected);
    });
  }
}
