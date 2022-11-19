import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

import 'dashboard_state.dart';

class DashboardViewModel extends BaseViewModel<DashboardState> {
  DashboardViewModel(this._facadeUseCases) : super(const DashboardState()) {
    _listenStreams();
  }

  final DashboardFacade _facadeUseCases;

  late StreamSubscription<StatsModel> _streamStatsSubscription;
  late StreamSubscription<DsaExerciseModel?> _streamRandomSubscription;
  late StreamSubscription<Iterable<DsaExerciseModel>>
      _streamSimilarExercisesSubscription;

  @override
  void close() {
    _streamStatsSubscription.cancel();
    _streamSimilarExercisesSubscription.cancel();
    _streamRandomSubscription.cancel();
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

    _streamRandomSubscription = _facadeUseCases.readRandomExercise
        .call(ReadRandomExercisesData())
        .doOnData(_newRandomExercisesEmit)
        .listen((_) {});
  }

  void _newStatsEmit(StatsModel stats) {
    emit(state.copyWith(statsModel: stats));
  }

  void _newSimilarExercisesEmit(Iterable<DsaExerciseModel> items) {
    emit(state.copyWith(similarExercises: items));
  }

  void _newRandomExercisesEmit(DsaExerciseModel? item) {
    emit(state.copyWith(randomExercises: item));
  }
}
