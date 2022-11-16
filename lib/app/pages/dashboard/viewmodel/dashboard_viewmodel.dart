import 'dart:async';

import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';
import 'package:rxdart/rxdart.dart';

import 'dashboard_state.dart';

class DashboardViewModel extends BaseViewModel<DashboardState> {
  DashboardViewModel(this._facadeUseCases) : super(const DashboardState()) {
    _listenStreams();
  }

  final DashboardFacade _facadeUseCases;

  late StreamSubscription<StatsModel> _streamStatsSubscription;
  late StreamSubscription<Iterable<DsaExerciseModel>>
      _streamSimilarExercisesSubscription;

  @override
  void close() {
    _streamStatsSubscription.cancel();
    _streamSimilarExercisesSubscription.cancel();
    super.close();
  }

  void _listenStreams() {
    _streamStatsSubscription = _facadeUseCases.readStatsUseCase
        .call(ReadStatsData())
        .doOnData(_newStatsEmit)
        .listen((_) {});

    _streamSimilarExercisesSubscription = _facadeUseCases.readSimilarExercises
        .call(ReadSimilarExercisesData())
        .doOnData(_newSimilarExercisesEmit)
        .listen((_) {});
  }

  void _newStatsEmit(StatsModel stats) {
    emit(state.copyWith(statsModel: stats));
  }

  void _newSimilarExercisesEmit(Iterable<DsaExerciseModel> items) {
    emit(state.copyWith(similarExercises: items));
  }
}
