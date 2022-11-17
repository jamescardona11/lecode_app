import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

import 'dsa_list_state.dart';

class DsaListViewModel extends BaseViewModel<DsaListState> {
  final DsaUseCasesFacade dsaUseCases;
  final StreamQueryUseCase<Iterable<DsaExerciseModel>,
      ReadAllDsaExercisesWithPaginationData> readAllDsaExercisesWithPagination;

  DsaListViewModel(
    this.dsaUseCases,
    this.readAllDsaExercisesWithPagination,
  ) : super(const DsaListState()) {
    readDsaExercises();
  }

  Future<void> markProblemAsRead(String id) async {
    await dsaUseCases.markAsComplete.call(MarkAsCompleteData(id));
  }

  Future<void> readDsaExercises() async {
    final dsaExercises = await readAllDsaExercisesWithPagination
        .call(ReadAllDsaExercisesWithPaginationData(
            [], state.itemsPagination + 40))
        .first;
    // .toList();

    emit(
      state.copyWith(
        itemsPagination: dsaExercises.length,
        items: dsaExercises,
      ),
    );
  }
}
