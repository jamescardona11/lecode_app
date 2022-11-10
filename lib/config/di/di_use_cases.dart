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

  @Singleton(as: FutureCommandUseCase<SaveAllDsaExercisesData>)
  SaveAllPathContent get saveAllPathContentData;

  @Singleton(
      as: FutureQueryUseCase<RemoteAppResponse<DsaExerciseModel>,
          FetchAllDsaExercisesData>)
  FetchAllDsaExercises get fetchAllPathContent;

  /// facade
  @singleton
  DsaContentUseCasesFacade get pathDetailUseCasesFacade;

  @Singleton(as: FutureCommandUseCase<AppInitFirstTimeData>)
  AppInitFirstTime get appInitFirstTime;
}
