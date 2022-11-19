import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/app/widgets/widgets.dart';
import 'package:lepath_app/base/base_app/base.dart';
import 'package:lepath_app/config/di/di.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';
import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/utils/utils.dart';

import 'viewmodel/viewmodel.dart';

class DsaContentPage
    extends MvvMProviderWidget<DsaContentViewModel, DsaContentState> {
  /// default constructor
  const DsaContentPage({
    super.key,
  });

  @override
  DsaContentViewModel get viewModel => getIt<DsaContentViewModel>();

  @override
  Widget buildWidget(BuildContext context, DsaContentState state) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 0,
        left: AppSizes.defPadding,
        right: AppSizes.defPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: state.groups.length,
              itemBuilder: (_, index) => _ItemContentWidget(
                groupsProblemsModel: state.groups[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemContentWidget extends StatefulWidget {
  /// default constructor
  const _ItemContentWidget({
    super.key,
    required this.groupsProblemsModel,
  });

  final DsaGroupsProblemsModel groupsProblemsModel;

  @override
  State<_ItemContentWidget> createState() => _ItemContentWidgetState();
}

class _ItemContentWidgetState extends State<_ItemContentWidget> {
  bool enable = false;
  late Color color;

  @override
  void initState() {
    super.initState();
    color = colorsForGroups(widget.groupsProblemsModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      color: color,
      showDefaultShadow: true,
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Center(
                child: FaIcon(
                  iconsForGroups(widget.groupsProblemsModel.id),
                  color: color,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.groupsProblemsModel.id,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            '${widget.groupsProblemsModel.solved}/${widget.groupsProblemsModel.total}',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: AppColors.pureWhite,
                ),
          ),
        ],
      ),
    );
  }
}


//  Text('Grind 75 questions'),
//           Text(
//               'Customize LeetCode study plans according to your needs. You are recommended to work on the questions in order'),
//           Expanded(
//             child: ListView.builder(
//               itemCount: 10,
//               itemBuilder: (_, index) => _ItemWidget(),
//             ),
//           ),