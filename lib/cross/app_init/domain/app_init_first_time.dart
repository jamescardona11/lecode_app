import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class AppInitFirstTimeData implements CommandData {
  const AppInitFirstTimeData();
}

class AppInitFirstTime implements FutureCommandUseCase<AppInitFirstTimeData> {
  AppInitFirstTime(
    this._appRepository,
    this._fetchDsaProblems,
    this._saveDsaProblems,
  );

  final AppRepository _appRepository;
  final FutureQueryUseCase<RemoteAppResponse<DsaProblemsAggregateDto>,
      FetchDsaProblemsData> _fetchDsaProblems;
  final FutureCommandUseCase<SaveDsaProblemsData> _saveDsaProblems;

  @override
  Future<void> call(
      [AppInitFirstTimeData data = const AppInitFirstTimeData()]) async {
    final response = await _appRepository.getUpdatesInformation();
    if (response.isLeft) return;

    final lastUpdateTime = await _appRepository.lastUpdateDate();
    final shouldUpdate = shouldUpdateInfo(response.right.value, lastUpdateTime);

    final elementsResult =
        await _fetchDsaProblems.call(FetchDsaProblemsData(shouldUpdate));

    if (elementsResult.isRight) {
      await _saveDsaProblems(SaveDsaProblemsData(elementsResult.right.value));
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
