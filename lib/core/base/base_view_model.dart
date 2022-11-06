import 'package:drip/drip.dart';

import 'base_state.dart';

abstract class BaseViewModel<VState extends BaseState> extends Drip<VState> {
  BaseViewModel(super.initialState);
}
