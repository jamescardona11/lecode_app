import 'package:lepath_app/app/path_content/model/use_cases/use_cases.dart';
import 'package:lepath_app/core/base/base.dart';

import 'app_repository.dart';
import 'update_info_model.dart';

class AppInitFirstTimeData implements CommandData {}

class AppInitFirstTime implements FutureCommandUseCase<AppInitFirstTimeData> {
  AppInitFirstTime(
    this._appRepository,
    this._fetchAllPathContent,
    this._saveAllPathContent,
  );

  final AppRepository _appRepository;
  final QueryUseCasePathItems _fetchAllPathContent;
  final FutureCommandUseCase<SaveAllPathContentData> _saveAllPathContent;

  @override
  Future<void> call([AppInitFirstTimeData? data]) async {
    final response = await _appRepository.getUpdatesInformation();
    if (response.isLeft) return;

    final lastUpdateTime = await _appRepository.lastUpdateDate();
    final shouldUpdate = shouldUpdateInfo(response.right.value, lastUpdateTime);

    final elementsResult =
        await _fetchAllPathContent.call(FetchAllPathContentData(shouldUpdate));

    if (elementsResult.isRight) {
      await _saveAllPathContent(
          SaveAllPathContentData(elementsResult.right.value));
    }
  }

  // final isFirstTime = lastUpdateTime.isBefore(DateTime(2022, 1, 1));
  bool shouldUpdateInfo(
    UpdateInfoModel updateInfoModel,
    DateTime lastUpdateTime,
  ) =>
      updateInfoModel.forceUpdate ||
      lastUpdateTime.isBefore(updateInfoModel.lastUpdate);
}
