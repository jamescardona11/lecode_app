import 'package:injectable/injectable.dart';
import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

@module
abstract class UseCasesModule {
  @Singleton(as: FutureCommandUseCase<MarkAsCompleteData>)
  MarkAsComplete get markAsComplete;

  @Singleton(as: FutureCommandUseCase<SaveDsaProblemsData>)
  SaveDsaProblems get saveDsaProblems;

  @Singleton(
      as: FutureQueryUseCase<RemoteAppResponse<DsaExerciseDto>,
          FetchDsaProblemsData>)
  FetchDsaProblems get fetchDsaProblems;

  /// facade
  @singleton
  DsaContentUseCasesFacade get dsaUseCasesFacade;

  @Singleton(as: FutureCommandUseCase<AppInitFirstTimeData>)
  AppInitFirstTime get appInitFirstTime;
}
