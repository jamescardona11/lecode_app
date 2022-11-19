import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

class DsaUseCasesFacade {
  DsaUseCasesFacade(
    this.markAsSolved,
    this.readAllDsaExercisesWithPagination,
    // this.readAllDsaExercises,
  );

  final FutureCommandUseCase<MarkAsSolvedData> markAsSolved;

  final StreamQueryUseCase<Iterable<DsaExerciseModel>,
      ReadAllDsaExercisesWithPaginationData> readAllDsaExercisesWithPagination;
}
