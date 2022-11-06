import 'package:drip/drip.dart';
import 'package:flutter/material.dart';
import 'package:lepath_app/core/base/base_state.dart';

import 'base_view_model.dart';

typedef VMBuilder<V extends BaseViewModel, S extends BaseState> = Widget
    Function(V viewModel, BaseState state);

abstract class BaseScreen<V extends BaseViewModel<VState>,
    VState extends BaseState> extends StatelessWidget {
  /// default constructor
  const BaseScreen({
    super.key,
    required this.builder,
  });

  final VMBuilder builder;

  V get viewModelBuilder;

  @override
  Widget build(BuildContext context) {
    return DripProvider<V>(
      create: (_) => viewModelBuilder,
      child: DripBuilder<V, VState>(
        streamListener: false,
        builder: (_, state) => builder.call(viewModelBuilder, state),
      ),
    );
  }
}
