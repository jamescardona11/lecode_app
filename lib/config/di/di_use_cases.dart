import 'package:injectable/injectable.dart';
import 'package:lepath_app/app/path_content/model/use_cases/use_cases.dart';
import 'package:lepath_app/core/base/base.dart';
import 'package:lepath_app/cross/app_init_first_time.dart';

@module
abstract class UseCasesModule {
  @Singleton(as: FutureCommandUseCase<MarkAsCompleteParam>)
  MarkAsComplete get markAsComplete;

  /// facade
  @singleton
  PathContentUseCasesFacade get pathDetailUseCasesFacade;

  @Singleton(as: FacadeUseCase<AppInitFirstTimeData>)
  AppInitFirstTime get appInitFirstTime;
}
