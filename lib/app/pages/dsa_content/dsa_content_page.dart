import 'package:flutter/material.dart';

import 'package:drip/drip.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lepath_app/app/widgets/widgets.dart';
import 'package:lepath_app/config/di/di.dart';
import 'package:lepath_app/config/theme/styles/styles.dart';
import 'package:lepath_app/base/base_app/base.dart';

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
              itemCount: 6,
              itemBuilder: (_, index) => _ItemContentWidget(),
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
  });

  @override
  State<_ItemContentWidget> createState() => _ItemContentWidgetState();
}

class _ItemContentWidgetState extends State<_ItemContentWidget> {
  bool enable = false;

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      // height: 100,
      color: AppColors.pureWhite,
      showDefaultShadow: true,
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.fonticons,
                ),
              ),
            ),
          ),
          Text(
            'Title of path',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            '1/200',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.grey,
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