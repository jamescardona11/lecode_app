import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/app/pages/dsa_list/widgets/flexible_bar.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';

class SliverBar extends StatelessWidget {
  /// default constructor
  const SliverBar({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const FaIcon(
                FontAwesomeIcons.code,
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
      backgroundColor: AppColors.blueBlack,
      pinned: false,
      floating: true,
      snap: true,
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        background: FlexibleBar(
          description: description,
        ),
      ),
    );
  }
}
