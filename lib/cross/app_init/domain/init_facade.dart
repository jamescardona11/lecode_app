import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class InitUseCasesFacade {
  InitUseCasesFacade(
    this.fetchDsaProblems,
    this.saveDsaProblems,
    this.saveDsaExercise,
  );

  final FutureCommandUseCase<SaveDsaProblemsData> saveDsaProblems;

  final FutureCommandUseCase<SaveDsaExerciseData> saveDsaExercise;

  final FutureQueryUseCase<RemoteAppResponse<DsaProblemsAggregateDto>,
      FetchDsaProblemsData> fetchDsaProblems;
}
