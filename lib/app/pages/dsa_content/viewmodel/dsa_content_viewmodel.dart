import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

import 'dsa_content_state.dart';

class DsaContentViewModel extends BaseViewModel<DsaContentState> {
  DsaContentViewModel(this._readAllGroups) : super(const DsaContentState()) {
    _listenStreams();
  }

  final StreamQueryUseCase<Iterable<DsaGroupsExercisesModel>,
      ReadAllGroupsExercisesData> _readAllGroups;

  late StreamSubscription<Iterable<DsaGroupsExercisesModel>>
      _streamGroupsExercisesSubscription;

  @override
  void close() {
    _streamGroupsExercisesSubscription.cancel();
    super.close();
  }

  Future<void> _listenStreams() async {
    _streamGroupsExercisesSubscription = _readAllGroups
        .call(const ReadAllGroupsExercisesData())
        .doOnData(_emitNewGroupsData)
        .listen((_) {});
  }

  void _emitNewGroupsData(Iterable<DsaGroupsExercisesModel> items) {
    emit(state.copyWith(groups: items.toList()));
  }
}
