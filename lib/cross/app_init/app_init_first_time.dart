import 'package:lepath_app/core/base/base.dart';

import 'app_repository.dart';

class AppInitFirstTimeData implements CommandParam {}

class AppInitFirstTime implements FutureCommandUseCase<AppInitFirstTimeData> {
  AppInitFirstTime(this._repository);

  final AppRepository _repository;

  @override
  Future<void> call([AppInitFirstTimeData? data]) async {
    final response = await _repository.getUpdatesInformation();
    if (response.isLeft) return;

    final updateInfoModel = response.right.value;
    final lastUpdateTime = await _repository.lastUpdateDate();

    // final isFirstTime = lastUpdateTime.isBefore(DateTime(2022, 1, 1));
    final shouldUpdateInfo = updateInfoModel.forceUpdate ||
        lastUpdateTime.isBefore(updateInfoModel.lastUpdate);

    if (shouldUpdateInfo) {
      await _repository.initAppInformationForFirstTime();
    }
  }
}
