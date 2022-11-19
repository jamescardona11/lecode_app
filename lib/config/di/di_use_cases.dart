import 'package:injectable/injectable.dart';
import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

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

  /// int facade ↑
  @singleton
  InitUseCasesFacade get initUseCasesFacade;

  @Singleton(as: FutureCommandUseCase<MarkAsSolvedData>)
  MarkAsSolved get markAsSolved;

  @Singleton(
      as: StreamQueryUseCase<Iterable<DsaExerciseModel>,
          ReadAllDsaExercisesData>)
  ReadAllDsaExercises get readAllDsaExercises;

  @Singleton(
      as: StreamQueryUseCase<Iterable<DsaExerciseModel>,
          ReadAllDsaExercisesWithPaginationData>)
  ReadAllDsaExercisesWithPagination get readAllDsaExercisesWithPagination;

  /// dsa facade ↑
  @singleton
  DsaUseCasesFacade get dsaUseCasesFacade;

  @Singleton(as: StreamQueryUseCase<StatsModel, ReadStatsData>)
  ReadStatsUseCase get readStatsUseCase;

  @Singleton(
      as: StreamQueryUseCase<Iterable<DsaExerciseModel>,
          ReadSimilarExercisesData>)
  ReadSimilarExercisesUseCase get readSimilarExercises;

  @Singleton(as: StreamQueryUseCase<DsaExerciseModel?, ReadRandomExercisesData>)
  ReadRandomExercisesUseCase get readRandomExercises;

  /// facade dashboard ↑
  @singleton
  DashboardFacade get dashboardUseCasesFacade;
}
