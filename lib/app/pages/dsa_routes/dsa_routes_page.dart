import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lecode_app/app/pages/dsa_routes/dsa_route_detail_page.dart';
import 'package:lecode_app/app/widgets/widgets.dart';
import 'package:lecode_app/base/base_app/base.dart';
import 'package:lecode_app/config/di/di.dart';
import 'package:lecode_app/config/theme/styles/styles.dart';
import 'package:lecode_app/core/core.dart';
import 'package:lecode_app/utils/utils.dart';

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
          top: 60,
          left: AppSizes.defPadding,
          right: AppSizes.defPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Learning Routes',
              style: Theme.of(context).textTheme.headline5,
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 20),
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
    );
  }
}

class _ItemRoutesWidget extends StatefulWidget {
  /// default constructor
  const _ItemRoutesWidget({
    required this.routeProblemsModel,
  });

  final DsaRouteProblemsModel routeProblemsModel;

  @override
  State<_ItemRoutesWidget> createState() => _ItemRoutesWidgetState();
}

class _ItemRoutesWidgetState extends State<_ItemRoutesWidget> {
  bool enable = false;
  late Color color;
  late IconData icon;

  @override
  void initState() {
    super.initState();
    color = colorsForRoutes(widget.routeProblemsModel.id);
    icon = iconsForRoutes(widget.routeProblemsModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      color: AppColors.white,
      showDefaultShadow: true,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DsaRouteDetailPage(
              dsaRouteProblemsModel: widget.routeProblemsModel,
              color: color,
              icon: icon,
            ),
          ),
        );
      },
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
                  icon,
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