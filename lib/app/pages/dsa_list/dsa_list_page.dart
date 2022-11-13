import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lepath_app/app/pages/dsa_list/viewmodel/viewmodel.dart';
import 'package:lepath_app/app/widgets/exercise_item_widget.dart';
import 'package:lepath_app/config/context_extension.dart';
import 'package:lepath_app/config/di/di.dart';
import 'package:lepath_app/core/core.dart';
import 'package:drip/drip.dart';
import 'package:lepath_app/cross/cross.dart';

class DsaListPage extends MvvMProviderWidget<DsaListViewModel, DsaListState> {
  /// default constructor
  const DsaListPage({
    super.key,
    this.title = '',
    this.description = '',
    this.group = '',
  });

  final String title;
  final String description;
  final String group;

  @override
  DsaListViewModel get viewModelBuilder => getIt<DsaListViewModel>();

  @override
  Widget buildWidget(BuildContext context, DsaListState state) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          // padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 40),
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Text('ajsasnaisn'),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.items.length,
                  (context, index) => ExerciseItemWidget(
                    exercise: state.items.elementAt(index),
                    isLast: index == state.items.length - 1,
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
