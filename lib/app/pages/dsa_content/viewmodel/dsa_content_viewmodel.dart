import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

import 'dsa_content_state.dart';

class DsaContentViewModel extends BaseViewModel<DsaContentState> {
  DsaContentViewModel(this._readAllGroups) : super(const DsaContentState()) {
    _listenStreams();
  }

  final StreamQueryUseCase<Iterable<DsaGroupsProblemsModel>,
      ReadAllGroupsProblemsData> _readAllGroups;

  late StreamSubscription<Iterable<DsaGroupsProblemsModel>>
      _streamGroupsProblemsSubscription;

  @override
  void close() {
    _streamGroupsProblemsSubscription.cancel();
    super.close();
  }

  Future<void> _listenStreams() async {
    _streamGroupsProblemsSubscription = _readAllGroups
        .call(const ReadAllGroupsProblemsData())
        .doOnData(_emitNewGroupsData)
        .listen((_) {});
  }

  void _emitNewGroupsData(Iterable<DsaGroupsProblemsModel> items) {
    emit(state.copyWith(groups: items.toList()));
  }
}
