import 'package:flutter/material.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';

import 'search_bar.dart';
import 'show_modal.dart';

class FlexibleBar extends StatelessWidget {
  const FlexibleBar({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            description,
            style: const TextStyle(
              fontSize: 14.0,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              bottom: 10.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    minHeight: 3,
                    backgroundColor: AppColors.grey3,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.green,
                    ),
                    value: 0.8,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '10/100',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SearchBar(
            onTapOrderIcon: () {
              showFloatingModalBottomSheet(
                context: context,
              );
            },
          ),
        ],
      ),
    );
  }
}
