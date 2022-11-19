import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

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
