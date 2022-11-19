import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';
import 'package:rxdart/rxdart.dart';

import 'dsa_list_state.dart';

class DsaListViewModel extends BaseViewModel<DsaListState> {
  final DsaUseCasesFacade dsaUseCases;

  DsaListViewModel(
    this.dsaUseCases,
  ) : super(const DsaListState()) {
    readDsaExercises();
  }

  Future<void> markProblemAsRead(String id) async {
    await dsaUseCases.markAsSolved.call(MarkAsSolvedData(id));
  }

  Future<void> readDsaExercises() async {
    dsaUseCases.readAllDsaExercisesWithPagination
        .call(ReadAllDsaExercisesWithPaginationData(
            [], state.itemsPagination + 40))
        .doOnData(_emitNewDsaItems)
        .listen((_) {});
  }

  void _emitNewDsaItems(Iterable<DsaExerciseModel> items) {
    emit(
      state.copyWith(
        itemsPagination: items.length,
        items: items,
      ),
    );
  }
}
