import 'package:flutter/material.dart';

class ContentView extends StatelessWidget {
  /// default constructor
  const ContentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Grind 75 questions'),
          Text(
              'Customize LeetCode study plans according to your needs. You are recommended to work on the questions in order'),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, index) => SizedBox(),
            ),
          )
        ],
      ),
    );
  }
}
