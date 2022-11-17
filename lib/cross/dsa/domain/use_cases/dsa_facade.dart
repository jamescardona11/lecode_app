import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class DsaUseCasesFacade {
  DsaUseCasesFacade(
    this.markAsSolved,
    // this.readAllDsaExercisesWithPagination,
    this.readAllDsaExercises,
  );

  final FutureCommandUseCase<MarkAsSolvedData> markAsSolved;

  final StreamQueryUseCase<Iterable<DsaExerciseModel>, ReadAllDsaExercisesData>
      readAllDsaExercises;
}
