import 'package:injectable/injectable.dart';
import 'package:lepath_app/base/base.dart';
import 'package:lepath_app/core/core.dart';

@module
abstract class UseCasesModule {
  /// facade cross DSA ↓

  @Singleton(
      as: StreamQueryUseCase<Iterable<DsaProblemModel>, ReadAllDsaProblemsData>)
  ReadAllDsaProblems get readAllDsaProblems;

  @singleton
  CrossDsaFacade get crossDsaFacade;

  /// int facade ↓
  @singleton
  InitUseCasesFacade get initUseCasesFacade;

  @Singleton(as: FutureCommandUseCase<AppInitFirstTimeData>)
  AppInitFirstTime get appInitFirstTime;

  @Singleton(as: FutureCommandUseCase<SaveDsaRoutesProblemsData>)
  SaveDsaRoutesProblems get saveDsaRoutesProblems;

  @Singleton(as: FutureCommandUseCase<SaveDsaProblemData>)
  SaveDsaProblem get saveDsaProblem;

  /// dsa facade ↓
  @singleton
  DsaUseCasesFacade get dsaUseCasesFacade;
  @Singleton(
      as: FutureQueryUseCase<RemoteAppResponse<DsaProblemDto>,
          FetchDsaProblemsData>)
  FetchDsaProblems get fetchDsaProblems;

  @Singleton(as: FutureCommandUseCase<MarkAsSolvedData>)
  MarkAsSolved get markAsSolved;

  @Singleton(
      as: StreamQueryUseCase<Iterable<DsaProblemModel>,
          ReadAllDsaProblemsFilteringData>)
  ReadAllDsaProblemsFiltering get readAllDsaProblemsFiltering;

  /// facade dashboard ↓
  @singleton
  DashboardFacade get dashboardUseCasesFacade;

  @Singleton(as: StreamQueryUseCase<StatsModel, ReadStatsData>)
  ReadStatsUseCase get readStatsUseCase;

  @Singleton(
      as: StreamQueryUseCase<Iterable<DsaProblemModel>,
          ReadSimilarProblemsData>)
  ReadSimilarProblemsUseCase get readSimilarProblems;

  @Singleton(as: StreamQueryUseCase<DsaProblemModel?, ReadRandomProblemsData>)
  ReadRandomProblemsUseCase get readRandomProblems;

  /// dsa routes ↓
  @Singleton(as: StreamQueryUseCase<Iterable<DsaRouteModel>, ReadAllRoutesData>)
  ReadAllRoutes get readAllRoutes;

  @Singleton(
      as: StreamQueryUseCase<Iterable<DsaRouteProblemsModel>,
          ReadAllRoutesProblemsData>)
  ReadAllRoutesProblems get readDsaAllRoutesProblems;
}
