import 'dart:async';

import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';
import 'package:rxdart/rxdart.dart';

import 'dashboard_state.dart';

class DashboardViewModel extends BaseViewModel<DashboardState> {
  DashboardViewModel(this._readStatsUseCase) : super(const DashboardState()) {
    _listenStreams();
  }

  final ReadStatsUseCase _readStatsUseCase;

  late StreamSubscription<StatsModel> _streamSubscription;

  @override
  void close() {
    _streamSubscription.cancel();
    super.close();
  }

  void _listenStreams() {
    _streamSubscription = _readStatsUseCase
        .call(ReadStatsData())
        .doOnData(_newStatsEmit)
        .listen((_) {});
  }

  void _newStatsEmit(StatsModel stats) {
    print(stats);
    emit(state.copyWith(statsModel: stats));
  }
}
