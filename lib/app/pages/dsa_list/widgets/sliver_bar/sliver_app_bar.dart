import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'flexible_bar.dart';

class SliverBar extends StatelessWidget {
  /// default constructor
  const SliverBar({
    Key? key,
    required this.title,
    required this.description,
    this.showProgress = true,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final String title;
  final String description;
  final IconData icon;
  final bool showProgress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                icon,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
      backgroundColor: color,
      pinned: false,
      floating: true,
      snap: true,
      expandedHeight: showProgress ? 220.0 : 150,
      flexibleSpace: FlexibleSpaceBar(
        background: FlexibleBar(
          description: description,
          showProgress: showProgress,
        ),
      ),
    );
  }
}
