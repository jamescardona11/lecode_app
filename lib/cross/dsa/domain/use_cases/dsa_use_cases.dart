import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class DsaUseCasesFacade {
  DsaUseCasesFacade(
    this.markAsComplete,
    this.fetchDsaProblems,
    this.saveDsaProblems,
    this.saveDsaExercise,
    this.readAllDsaExercises,
  );

  final FutureCommandUseCase<MarkAsCompleteData> markAsComplete;

  final FutureCommandUseCase<SaveDsaProblemsData> saveDsaProblems;

  final FutureCommandUseCase<SaveDsaExerciseData> saveDsaExercise;

  final FutureQueryUseCase<RemoteAppResponse<DsaProblemsAggregateDto>,
      FetchDsaProblemsData> fetchDsaProblems;

  final QueryUseCase<Iterable<DsaExerciseDto>, ReadAllDsaExercisesData>
      readAllDsaExercises;
}
