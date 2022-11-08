import 'package:lepath_app/core/base/base.dart';

import 'app_repository.dart';

class AppInitFirstTimeData {}

class AppInitFirstTime extends FacadeUseCase<AppInitFirstTimeData> {
  AppInitFirstTime(this._repository);

  final AppRepository _repository;

  @override
  Future<void> call(AppInitFirstTimeData data) async {
    final lastUpdateTime = await _repository.lastUpdateDate();
    final firstTime = lastUpdateTime.isBefore(DateTime(2022, 1, 1));
    bool updateInfo = false;

    if (!firstTime) {
      final response = await _repository.getUpdatesInformation();
      updateInfo =
          response.forceUpdate || lastUpdateTime.isBefore(response.lastUpdate);
    }

    if (firstTime || updateInfo) {
      await _repository.initAppInformationForFirstTime();
    }
  }
}
