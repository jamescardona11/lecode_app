import 'package:drip/drip.dart';
import 'package:flutter/material.dart';
import 'package:lepath_app/app/pages/dsa_list/viewmodel/viewmodel.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';

import '../show_modal.dart';
import 'search_bar.dart';

class FlexibleBar extends StatelessWidget {
  const FlexibleBar({
    Key? key,
    required this.description,
    this.showProgress = true,
  }) : super(key: key);

  final String description;
  final bool showProgress;

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
          if (showProgress)
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                bottom: 0.0,
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
                  const SizedBox(width: 20),
                  Text(
                    '10/100',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          if (showProgress) const SizedBox(height: 10),
          SearchBar(
            onTapOrderIcon: () {
              showFloatingModalBottomSheet(
                  context: context,
                  onFilterTap: (data) {
                    context.read<DsaListViewModel>().filteringData(data);
                  });
            },
          ),
        ],
      ),
    );
  }
}
