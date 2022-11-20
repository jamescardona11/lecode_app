import 'dart:async';

import 'package:lecode_app/base/base.dart';
import 'package:lecode_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

import 'dashboard_state.dart';

class DashboardViewModel extends BaseViewModel<DashboardState> {
  DashboardViewModel(this._facadeUseCases) : super(const DashboardState()) {
    _listenStreams();
  }

  final DashboardFacade _facadeUseCases;

  late StreamSubscription<StatsModel> _streamStatsSubscription;
  late StreamSubscription<DsaProblemModel?> _streamRandomSubscription;
  late StreamSubscription<Iterable<DsaProblemModel>>
      _streamSimilarProblemsSubscription;

  @override
  void close() {
    _streamStatsSubscription.cancel();
    _streamSimilarProblemsSubscription.cancel();
    _streamRandomSubscription.cancel();
    super.close();
  }

  void _listenStreams() {
    _streamStatsSubscription = _facadeUseCases.readStatsUseCase
        .call(ReadStatsData())
        .doOnData(_newStatsEmit)
        .listen((_) {});

    _streamSimilarProblemsSubscription = _facadeUseCases.readSimilarProblems
        .call(ReadSimilarProblemsData())
        .doOnData(_newSimilarProblemsEmit)
        .listen((_) {});

    _streamRandomSubscription = _facadeUseCases.readRandomProblem
        .call(ReadRandomProblemsData())
        .doOnData(_newRandomProblemsEmit)
        .listen((_) {});
  }

  void _newStatsEmit(StatsModel stats) {
    emit(state.copyWith(statsModel: stats));
  }

  void _newSimilarProblemsEmit(Iterable<DsaProblemModel> items) {
    emit(state.copyWith(similarProblems: items));
  }

  void _newRandomProblemsEmit(DsaProblemModel? item) {
    emit(state.copyWith(randomProblems: item));
  }
}
