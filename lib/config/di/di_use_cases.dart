import 'package:injectable/injectable.dart';
import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

@module
abstract class UseCasesModule {
  @Singleton(as: FutureCommandUseCase<AppInitFirstTimeData>)
  AppInitFirstTime get appInitFirstTime;

  @Singleton(as: FutureCommandUseCase<SaveDsaProblemsData>)
  SaveDsaProblems get saveDsaProblems;

  @Singleton(as: FutureCommandUseCase<SaveDsaExerciseData>)
  SaveDsaExercise get saveDsaExercise;

  @Singleton(
      as: FutureQueryUseCase<RemoteAppResponse<DsaExerciseDto>,
          FetchDsaProblemsData>)
  FetchDsaProblems get fetchDsaProblems;

  /// facade
  @singleton
  InitUseCasesFacade get initUseCasesFacade;

  @Singleton(as: FutureCommandUseCase<MarkAsCompleteData>)
  MarkAsComplete get markAsComplete;

  @Singleton(
      as: StreamQueryUseCase<Iterable<DsaExerciseModel>,
          ReadAllDsaExercisesData>)
  ReadAllDsaExercises get readAllDsaExercises;

  /// facade
  @singleton
  DsaUseCasesFacade get dsaUseCasesFacade;

  @Singleton(as: StreamQueryUseCase<StatsModel, ReadStatsData>)
  ReadStatsUseCase get readStatsUseCase;
}
