import 'package:drip/drip.dart';
import 'package:flutter/material.dart';

import 'base_state.dart';
import 'base_view_model.dart';

typedef VMBuilder<V extends BaseViewModel<VState>, VState extends BaseState>
    = Widget Function(BuildContext context, VState state);

abstract class MvvMProviderWidget<V extends BaseViewModel<VState>,
    VState extends BaseState> extends StatelessWidget {
  /// default constructor
  const MvvMProviderWidget({
    super.key,
  });

  V get viewModelBuilder;

  Widget buildWidget(BuildContext context, VState state);

  @protected
  @override
  Widget build(BuildContext context) {
    return DripProvider<V>(
      create: (_) => viewModelBuilder,
      child: _MvvMBuilder<V, VState>(
        builder: (context, state) => buildWidget(context, state as VState),
      ),
    );
  }
}

class _MvvMBuilder<V extends BaseViewModel<VState>, VState extends BaseState>
    extends StatelessWidget {
  /// default constructor
  const _MvvMBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final VMBuilder builder;

  @override
  Widget build(BuildContext context) {
    return DripBuilder<V, VState>(
      streamListener: false,
      builder: builder,
    );
  }
}
