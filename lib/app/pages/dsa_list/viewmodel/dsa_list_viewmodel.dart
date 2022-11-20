import 'dart:async';

import 'package:lecode_app/base/base.dart';
import 'package:lecode_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

import 'dsa_list_state.dart';

// todo fix issue with filtering data, when i mark as solved the streams emits again and that change my filter
class DsaListViewModel extends BaseViewModel<DsaListState> {
  DsaListViewModel(this.dsaUseCases) : super(const DsaListState()) {
    _listenStreams();
  }

  final DsaUseCasesFacade dsaUseCases;
  late StreamSubscription<Iterable<DsaProblemModel>>
      _streamProblemsSubscription;

  @override
  void close() {
    _streamProblemsSubscription.cancel();
    super.close();
  }

  Future<void> filteringData(FilteringData filteringData) async {
    emit(state.copyWith(
      filteringData: filteringData,
    ));

    final items = await dsaUseCases.readAllDsaProblemsWithPagination
        .call(ReadAllDsaProblemsFilteringData(
          takeX: state.itemsPagination,
          filteringData: filteringData,
        ))
        .first;

    _emitNewDsaItems(items);
  }

  Future<void> markProblemAsRead(String id) async {
    await dsaUseCases.markAsSolved.call(MarkAsSolvedData(id));
  }

  void _listenStreams() async {
    _streamProblemsSubscription = dsaUseCases.readAllDsaProblemsWithPagination
        .call(const ReadAllDsaProblemsFilteringData(takeX: 30))
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
