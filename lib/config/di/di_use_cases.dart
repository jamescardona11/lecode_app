import 'package:injectable/injectable.dart';
import 'package:lepath_app/app/dsa_content/model/entities/dsa_exercise.dart';
import 'package:lepath_app/app/dsa_content/model/use_cases/use_cases.dart';
import 'package:lepath_app/core/base/base.dart';
import 'package:lepath_app/core/base/remote/remote_app_response.dart';
import 'package:lepath_app/cross/app_init/app_init_first_time.dart';

@module
abstract class UseCasesModule {
  @Singleton(as: FutureCommandUseCase<MarkAsCompleteData>)
  MarkAsComplete get markAsComplete;

  @Singleton(as: FutureCommandUseCase<SaveDsaProblemsData>)
  SaveDsaProblems get saveDsaProblems;

  @Singleton(
      as: FutureQueryUseCase<RemoteAppResponse<DsaExerciseModel>,
          FetchDsaProblemsData>)
  FetchDsaProblems get fetchDsaProblems;

  /// facade
  @singleton
  DsaContentUseCasesFacade get dsaUseCasesFacade;

  @Singleton(as: FutureCommandUseCase<AppInitFirstTimeData>)
  AppInitFirstTime get appInitFirstTime;
}
