import 'package:drip/drip.dart';
import 'package:flutter/material.dart';

import 'base_state.dart';
import 'base_view_model.dart';

// typedef VMBuilder<V extends BaseViewModel, S extends BaseState> = Widget
//     Function(V viewModel, BaseState state);

abstract class BaseWidget<V extends BaseViewModel<VState>,
    VState extends BaseState> extends StatelessWidget {
  /// default constructor
  const BaseWidget({
    super.key,
  });

  V get viewModelBuilder;

  Widget buildWidget(BuildContext context, V viewModel);

  @protected
  @override
  Widget build(BuildContext context) {
    return DripProvider<V>(
      create: (_) => viewModelBuilder,
      child: DripBuilder<V, VState>(
        //streamListener: false,
        builder: (c, state) => buildWidget(c, viewModelBuilder),
      ),
    );
  }
}
