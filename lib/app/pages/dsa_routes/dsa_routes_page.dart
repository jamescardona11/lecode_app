import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/app/widgets/widgets.dart';
import 'package:lepath_app/base/base_app/base.dart';
import 'package:lepath_app/config/di/di.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';
import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/utils/utils.dart';

import 'viewmodel/viewmodel.dart';

class DsaRoutesPage
    extends MvvMProviderWidget<DsaRoutesViewModel, DsaRoutesState> {
  /// default constructor
  const DsaRoutesPage({
    super.key,
  });

  @override
  DsaRoutesViewModel get viewModel => getIt<DsaRoutesViewModel>();

  @override
  Widget buildWidget(BuildContext context, DsaRoutesState state) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 0,
          left: AppSizes.defPadding,
          right: AppSizes.defPadding,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Learning Routes',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: state.routes.length,
                  itemBuilder: (_, index) => _ItemRoutesWidget(
                    routeProblemsModel: state.routes[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemRoutesWidget extends StatefulWidget {
  /// default constructor
  const _ItemRoutesWidget({
    super.key,
    required this.routeProblemsModel,
  });

  final DsaRouteProblemsModel routeProblemsModel;

  @override
  State<_ItemRoutesWidget> createState() => _ItemRoutesWidgetState();
}

class _ItemRoutesWidgetState extends State<_ItemRoutesWidget> {
  bool enable = false;
  late Color color;

  @override
  void initState() {
    super.initState();
    color = colorsForRoutes(widget.routeProblemsModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      color: AppColors.white,
      showDefaultShadow: true,
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Center(
                child: FaIcon(
                  iconsForRoutes(widget.routeProblemsModel.id),
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.routeProblemsModel.id,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            '${widget.routeProblemsModel.solved}/${widget.routeProblemsModel.total}',
            style: Theme.of(context).textTheme.bodyText2,
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