import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

import 'dsa_list_state.dart';

class DsaListViewModel extends BaseViewModel<DsaListState> {
  final DsaUseCasesFacade dsaUseCases;

  DsaListViewModel(
    this.dsaUseCases,
  ) : super(const DsaListState()) {
    _listenStreams();
  }

  late StreamSubscription<Iterable<DsaProblemModel>>
      _streamProblemsSubscription;

  @override
  void close() {
    _streamProblemsSubscription.cancel();
    super.close();
  }

  void changeMainView() {
    emit(state.copyWith(showFilterList: !state.showFilterList));
  }

  Future<void> markProblemAsRead(String id) async {
    await dsaUseCases.markAsSolved.call(MarkAsSolvedData(id));
  }

  Future<void> _listenStreams() async {
    _streamProblemsSubscription = dsaUseCases.readAllDsaProblemsWithPagination
        .call(ReadAllDsaProblemsWithPaginationData(
            [], state.itemsPagination + 40))
        .doOnData(_emitNewDsaItems)
        .listen((_) {});
  }

  void _emitNewDsaItems(Iterable<DsaProblemModel> items) {
    emit(
      state.copyWith(
        itemsPagination: items.length,
        items: items,
      ),
    );
  }
}
