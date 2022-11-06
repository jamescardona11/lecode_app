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
              itemBuilder: (_, index) => _ItemWidget(),
            ),
          )
        ],
      ),
    );
  }
}

class _ItemWidget extends StatefulWidget {
  /// default constructor
  const _ItemWidget({
    super.key,
  });

  @override
  State<_ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<_ItemWidget> {
  bool enable = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          enable = !enable;
        });
      },
      child: SizedBox(
        height: 60,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Problem name'),
              Spacer(),
              if (enable) Icon(Icons.check),
            ],
          ),
        ),
      ),
    );
  }
}
