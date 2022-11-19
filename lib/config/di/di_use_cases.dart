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

  @Singleton(as: FutureCommandUseCase<SaveDsaGroupsProblemsData>)
  SaveDsaGroupsProblems get saveDsaGroupsProblems;

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
          ReadAllDsaProblemsWithPaginationData>)
  ReadAllDsaProblemsWithPagination get readAllDsaProblemsWithPagination;

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

  /// dsa content ↓
  @Singleton(
      as: StreamQueryUseCase<Iterable<DsaGroupsModel>, ReadAllGroupsData>)
  ReadAllGroups get readAllGroups;

  @Singleton(
      as: StreamQueryUseCase<Iterable<DsaGroupsProblemsModel>,
          ReadAllGroupsProblemsData>)
  ReadAllGroupsProblems get readDsaAllGroupsProblems;
}
