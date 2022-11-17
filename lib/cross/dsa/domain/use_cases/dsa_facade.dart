import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class DsaUseCasesFacade {
  DsaUseCasesFacade(
    this.markAsComplete,
    // this.readAllDsaExercisesWithPagination,
    this.readAllDsaExercises,
  );

  final FutureCommandUseCase<MarkAsCompleteData> markAsComplete;

  final StreamQueryUseCase<Iterable<DsaExerciseModel>, ReadAllDsaExercisesData>
      readAllDsaExercises;
}
