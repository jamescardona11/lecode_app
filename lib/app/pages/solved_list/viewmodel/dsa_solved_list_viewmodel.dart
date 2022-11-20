import 'dart:async';

import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

import 'dsa_solved_list_state.dart';

class DsaSolvedListViewModel extends BaseViewModel<DsaSolvedListState> {
  DsaSolvedListViewModel(this.dsaUseCases) : super(const DsaSolvedListState()) {
    _listenStreams();
  }

  final DsaUseCasesFacade dsaUseCases;
  late StreamSubscription<Iterable<DsaProblemModel>>
      _streamProblemsSubscription;

  @override
  void close() {
    // _streamProblemsSubscription.cancel();
    super.close();
  }

  Future<void> getMoreElements() async {
    final items = await dsaUseCases.readAllSolvedDsaProblems
        .call(const ReadAllSolvedDsaProblemsData())
        .first;

    _emitNewDsaItems(items);
  }

  Future<void> markProblemAsRead(String id) async {
    await dsaUseCases.markAsSolved.call(MarkAsSolvedData(id));
  }

  void _listenStreams() async {
    _streamProblemsSubscription = dsaUseCases.readAllSolvedDsaProblems
        .call(const ReadAllSolvedDsaProblemsData())
        .doOnData(_emitNewDsaItems)
        .listen((items) {
      if (items.isNotEmpty) {
        _streamProblemsSubscription.cancel();
      }
    });
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
