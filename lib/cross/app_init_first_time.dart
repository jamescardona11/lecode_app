import 'package:lepath_app/core/base/base.dart';

import 'app_repository.dart';

class AppInitFirstTimeData {}

class AppInitFirstTime extends CommandUseCase<AppInitFirstTimeData> {
  final AppRepository _repository;

  AppInitFirstTime(this._repository);

  @override
  void call(AppInitFirstTimeData data) =>
      _repository.initAppInformationForFirstTime();
}
