import 'package:lepath_app/core/core.dart';
import 'package:lepath_app/cross/cross.dart';

class AppInitFirstTimeData implements CommandData {
  const AppInitFirstTimeData();
}

class AppInitFirstTime implements FutureCommandUseCase<AppInitFirstTimeData> {
  AppInitFirstTime(
    this._appRepository,
    this._dsaUseCasesFacade,
  );

  final AppRepository _appRepository;
  final DsaContentUseCasesFacade _dsaUseCasesFacade;

  @override
  Future<void> call(
      [AppInitFirstTimeData data = const AppInitFirstTimeData()]) async {
    final response = await _appRepository.getUpdatesInformation();
    if (response.isLeft) return;

    final lastUpdateTime = await _appRepository.lastUpdateDate();
    final shouldUpdate = shouldUpdateInfo(response.right.value, lastUpdateTime);

    final elementsResult = await _dsaUseCasesFacade.fetchDsaProblems
        .call(FetchDsaProblemsData(shouldUpdate));

    if (elementsResult.isRight) {
      await _dsaUseCasesFacade.saveDsaProblems(
          SaveDsaProblemsData(elementsResult.right.value.dsaProblemsDto));
      await _dsaUseCasesFacade.saveDsaExercise(
          SaveDsaExerciseData(elementsResult.right.value.dsaExerciseDto));
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
