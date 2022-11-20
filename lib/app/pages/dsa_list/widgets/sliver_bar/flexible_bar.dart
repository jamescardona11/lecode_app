import 'package:drip/drip.dart';
import 'package:flutter/material.dart';
import 'package:lecode_app/app/pages/dsa_list/viewmodel/dsa_list_viewmodel.dart';
import 'package:lecode_app/config/theme/styles/styles.dart';
import 'package:lecode_app/core/core.dart';

import '../show_modal.dart';
import 'search_bar.dart';

class FlexibleBar extends StatefulWidget {
  const FlexibleBar({
    Key? key,
    required this.description,
    this.showProgress = true,
  }) : super(key: key);

  final String description;
  final bool showProgress;

  @override
  State<FlexibleBar> createState() => _FlexibleBarState();
}

class _FlexibleBarState extends State<FlexibleBar> {
  FilteringData? filteringData;

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
            widget.description,
            style: const TextStyle(
              fontSize: 14.0,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 8),
          if (widget.showProgress)
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                bottom: 0.0,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: LinearProgressIndicator(
                      minHeight: 3,
                      backgroundColor: Colors.black12,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.white,
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
          if (widget.showProgress) const SizedBox(height: 10),
          SearchBar(
            onTapOrderIcon: () {
              showFloatingModalBottomSheet(
                  context: context,
                  initialData: filteringData,
                  onFilterTap: (data) {
                    filteringData = data;

                    context.read<DsaListViewModel>().filteringData(data);
                  });
            },
          ),
        ],
      ),
    );
  }
}
