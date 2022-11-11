import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class DsaContentUseCasesFacade {
  DsaContentUseCasesFacade(
    this.markAsComplete,
    this.fetchDsaProblems,
    this.saveDsaProblems,
    this.saveDsaExercise,
  );

  final FutureCommandUseCase<MarkAsCompleteData> markAsComplete;

  final FutureCommandUseCase<SaveDsaProblemsData> saveDsaProblems;

  final FutureCommandUseCase<SaveDsaExerciseData> saveDsaExercise;

  final FutureQueryUseCase<RemoteAppResponse<DsaProblemsAggregateDto>,
      FetchDsaProblemsData> fetchDsaProblems;
}
