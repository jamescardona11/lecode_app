import 'package:injectable/injectable.dart';
import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

@module
abstract class UseCasesModule {
  @Singleton(as: FutureCommandUseCase<MarkAsCompleteData>)
  MarkAsComplete get markAsComplete;

  @Singleton(as: FutureCommandUseCase<SaveDsaProblemsData>)
  SaveDsaProblems get saveDsaProblems;

  @Singleton(as: FutureCommandUseCase<SaveDsaExerciseData>)
  SaveDsaExercise get saveDsaExercise;

  @Singleton(
      as: StreamQueryUseCase<Iterable<DsaExerciseDto>, ReadAllDsaExercisesData>)
  ReadAllDsaExercises get readAllDsaExercises;

  @Singleton(
      as: FutureQueryUseCase<RemoteAppResponse<DsaExerciseDto>,
          FetchDsaProblemsData>)
  FetchDsaProblems get fetchDsaProblems;

  /// facade
  @singleton
  DsaUseCasesFacade get dsaUseCasesFacade;

  @Singleton(as: FutureCommandUseCase<AppInitFirstTimeData>)
  AppInitFirstTime get appInitFirstTime;
}
